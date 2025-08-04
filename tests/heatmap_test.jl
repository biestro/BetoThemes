# test the contour theme

using CairoMakie
using BetoThemes
using DelimitedFiles

data = readdlm("./data/parabolic_cylinder.csv", ',', Float64)
x, y1, y2 = data[:,1], data[:,2], data[:,3]

let
  fig, gl = create_fig(; _dpi=100, _fontsize=9, bw = 0.5, lw=1, sw=1, ms=6)
  ax = Axis(gl[1,1])

  xlims!(ax, 0, 10)
  
  # contourf!(ax, x, y, z)
  lines!(ax, x, y1)
  lines!(ax, x, y2)

  save("im1.png", fig)
  fig

end