"""
Gong, Zongping, et al. "Topological phases of non-Hermitian systems." 
Physical Review X 8.3 (2018): 031079.
"""

using CairoMakie
using BetoThemes
# using GenericSchur
# using LinearAlgebra, 
# using SparseArrays
# using StaticArrays
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
let
fig = Figure(theme=BetoThemes.default(:math; sw=0.0), fontsize=20)

cmap = :phase
gl = GridLayout(fig[1,1])
gr = GridLayout(fig[1,2])
ax = Axis(gl[1,1], xlabel=fmt("Re \$E_n\$"), ylabel=fmt("Im \$E_n\$"))

# grids


sc=scatter!(ax, real(evals), imag(evals), color=colors, colormap=cmap)
scatter!(ax, real(evals_orig), imag(evals_orig), color=Makie.to_colormap(cmap)[1], 
                       strokewidth=1.0, label = L"\phi=0")
Colorbar(gr[1,1], sc, label = L"\phi")


axislegend(ax)
ax.aspect=DataAspect()
resize_to_layout!(fig)
fig
end