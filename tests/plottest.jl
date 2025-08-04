"""
Gong, Zongping, et al. "Topological phases of non-Hermitian systems." 
Physical Review X 8.3 (2018): 031079.
"""

using CairoMakie
using BetoThemes
using LinearAlgebra

# main code
N = 30
L  = 2.0 + 0im
R  = 1.0 + 0im
Npi = 20
sweep = LinRange(0,2pi, Npi)

evals = zeros(ComplexF64, N, Npi)
colors = Float64[]

for (i,xi) in enumerate(sweep)
  local H = circshift(diagm(ones(N)) * L * exp(3im*xi/N), 3) + circshift(diagm(ones(N)) * R* exp(-2im*xi/N), -2)
  # H[end,1] = H[end,1] * exp(-im*xi/)
  # H[1,end] = H[1,end] * exp(-im*xi)
  evals[:,i] = eigvals(H)
  push!(colors,ones(N)*xi...)
end

evals = evals[:]
H = circshift(diagm(ones(N)) * L , 3) + circshift(diagm(ones(N)) * R , -2)
evals_orig = eigvals(H)

# plotting
# fig = Figure(theme=BetoThemes.default(:math; sw=0.0), fontsize=20)

fig, gl = create_fig(; _size = (4,4), _dpi=100, _fontsize=9, bw = 0.5, lw=1, sw=0, ms=6)


cmap = :balance
ax = Axis(gl[1,1], xlabel=fmt("Re \$E_n\$"), ylabel=fmt("Im \$E_n\$"))

# grids
sc=scatter!(ax, real(evals), imag(evals), color=colors, colormap=cmap)

cb = Colorbar(gl[1,2], sc, label = L"\phi")
rowsize!(fig.layout, 1, Aspect(1,1))

save("flux.png", fig, px_per_unit=2); fig

fig, gl = create_fig(; _size = (5, 4),  _dpi=200, _fontsize=9, bw = 0.5, lw=1, sw=1, ms=6)

ax = Axis(gl[1,1])
x = LinRange(10^-2, 10^1, 500)
y1 = x .^ 2 .+ abs.(2 * randn(length(x)))
y2 = x .^ 3 .+ abs.(2 * randn(length(x))) 
y3 = x .^ 4 .+ abs.(2 * randn(length(x))) 
lines!(ax, x, y1, label = fmt("10^2"))
lines!(ax, x, y2, label = fmt("10^3"))
lines!(ax, x, y3, label = fmt("10^4"))

xlims!(ax, 10^-2, 10^1)

ax.yscale=log10
ax.xscale=log10
ax.xminorticks = IntervalsBetween(5)
ax.yminorticks = IntervalsBetween(5)
resize_to_layout!(fig)
save("lines.png", fig, px_per_unit = 2); fig

# heatmap
f(x,y) = (x + 2y^2) * abs(sin(y) + cos(x))
x = LinRange(-pi, pi, 140)
y = LinRange(-pi, pi, 140)
z = [f(x,y) for x in x, y in y]

fig, gl = create_fig(; _size = (4, 4),  _dpi=100, _fontsize=9, bw = 0.5, lw=1, sw=1, ms=6)
ax = Axis(gl[1,1])
cmap = :plasma
hm=heatmap!(ax, x, y, z)
contour!(ax, x, y, z, color = :black)
cb = Colorbar(gl[1,2], hm)
# ax.xtickcolor =
resize_to_layout!(fig)
fig
