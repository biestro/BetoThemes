

theme = Theme(
  Axis = (
    # xgridvisible=true, 
    # xgridstyle=:dash,
    # xgridcolor=:snow3,
    # ygridcolor=:snow3,
    # xminorgridstyle=:dash,
    # ygridvisible=true, 
    # ygridstyle=:dash,
    # yminorgridstyle=:dash,
    # # xminorgridvisible=true,
    # # yminorgridvisible=true,
    # xtickalign=1, 
    # ytickalign=1,
    # # xminorticksvisible = true,
    # # yminorticksvisible = true,
    # xminorticks=IntervalsBetween(9),
    # yminorticks=IntervalsBetween(9),
    # xminortickalign=1,
    # yminortickalign=1,
    # xticksmirrored=true,
    # xminorticksmirrored=true,
    # yticksmirrored=true,
    # yminorticksmirrored=true,
    # xautolimitmargin = (0.05, 0.05),
    # yautolimitmargin = (0.05, 0.05),
    # xticksize=10,
    # yticksize=10,
    # xminorticksize=5,
    # yminorticksize=5,
    # titlefont=:regular,
    # xticklabelpad = 10,
    # yticklabelpad = 10
    xgridstyle=:dash,
    ygridstyle=:dash,
    titlefont=:regular,
    ), 
  Lines=(; 
  cycle=:linestyle),
  # palette = (color = to_colormap(:seaborn_colorblind), marker = []),
  Scatter=(;
    cycle=:marker,
    # strokewidth=2,
    # color=RGBAf(0.,0.,0.,0.),
    strokecolor=:black, ),
  ScatterLines=(;
    cycle=Cycle([:linestyle, :marker], covary = true),
    ),
  # fonts = (; regular = "Consolas",
  #            bold = "Consolas Bold", 
  #             ),
  # fonts = (; regular = "CMU Serif",
  #            bold = "Times New Roman Bold", 
  #            italic = "Noto Sans Italic",
  #            bold_italic = "Noto Sans Bold Italic",
  #            ),

  #   )
  fonts = (; regular = "TeX Gyre Heros Makie",
             bold = "TeX Gyre Heros Makie Bold", 
             italic = "TeX Gyre Heros Makie Italic",
             bold_italic = "TeX Gyre Heros Makie Bold Italic",
  ),

  )


  # function theme_latexfonts()
  #   return Attributes(
  #     Axis = (
  #       titlefont = :regular),
  #     fonts = (
  #       :bold => texfont(:bold),
  #       :bolditalic => texfont(:bolditalic),
  #       :italic => texfont(:italic),
  #       :regular => texfont(:regular)
  #         ),          
  #         )
  # end

# colors = to_colormap(:okabe_ito)
colors = wong_colors()

# green_color=RGBf(0.0, 0.6196078431372549, 0.45098039215686275)
# purple_color=RGBf(0.5803921568627451,0.0,0.8274509803921568)

const _green = Makie.to_color(colorant"#009e73")
const _violet = Makie.to_color(colorant"#9400d3")
const _red = Makie.to_color(colorant"#DC3220")
const _blue = Makie.to_color(colorant"#005AB5")


const bbc_black = Makie.to_color(colorant"#222222")
const bbc_red = Makie.to_color(colorant"#b90005")
const bbc_blue = Makie.to_color(colorant"#1380A1")
const bbc_yellow = Makie.to_color(colorant"#FAAB18")


# Copied from MakieThemes
const ColorTheme = Dict{Symbol, Dict{Symbol, Any}}()

beto_colors() = collect(keys(ColorTheme))


function style_beto(; bw = 1.25, lw = 1.25, ms = 10, sw = 1.0)

  spinewidth = bw# basewidth * 0.75
  basewidth = bw
  markersize = ms
  linewidth = lw
  # linewidth = bw,
  strokewidth = sw
  return Attributes(

    fonts = (; regular = "TeX Gyre Heros Makie",
    bold = "TeX Gyre Heros Makie Bold", 
    italic = "TeX Gyre Heros Makie Italic",
    bold_italic = "TeX Gyre Heros Makie Bold Italic",
    ),

    Axis = Attributes(
      spinewidth = spinewidth,
      bottomspinevisible = true,
      topspinevisible = true,
      leftspinevisible = true,
      rightspinevisible = true,
      xgridvisible=false,
      ygridvisible=false,
      xgridwidth = basewidth,
      ygridwidth = basewidth,
      xgridstyle = (:dash,:dense),
      ygridstyle = (:dash,:dense),
      xticksize = 5.0,
      yticksize = 5.0,
      xtickwidth= basewidth,
      ytickwidth= basewidth,
    ),
    Colorbar = Attributes(labelrotation = 0),

    Axis3 = Attributes(
      xspinewidth = spinewidth,
      yspinewidth = spinewidth,
      zspinewidth = spinewidth,
      xspinestyle = :solid,
      yspinestyle = :solid,
      zspinestyle = :solid,
      xgridstyle = :solid,
      ygridstyle = :solid,
      zgridstyle = :solid,
      xlabeloffset = 30,
      ylabeloffset = 30,
      zlabeloffset = 30,
      xtickwidth=basewidth,
      ytickwidth=basewidth,
      ztickwidth=basewidth,
    ),
    Legend = Attributes(
      backgroundcolor = :white,
      framecolor=:transparent,
      framevisible = true, # otherwise conflicts with grids
      rowgap = 0,
      titlegap = 0,
    ),
    Scatter = Attributes(
      markersize = markersize,
      strokewidth = strokewidth,
    ),
    Lines= Attributes(
      linewidth=linewidth,
    ),
    ScatterLines= Attributes(
      linewidth=linewidth,
      markersize=markersize,
    ),
    StreamPlot= Attributes(
      linewidth=linewidth,
      markersize=0.0,
    ),
  )
end

# style_beto(basewidth) = style_beto(basewidth, basewidth, 10, 1.0)
# style_beto(basewidth, linewidth) = style_beto(basewidth, linewidth, 10, 1.0)
# style_beto(basewidth, linewidth, msize) = style_beto(basewidth, linewidth, msize, 1.0)
# style_beto(basewidth) = style_beto(basewidth, basewidth)

function color_beto(theme::Symbol)
    ct = ColorTheme[theme]
    palettes = merge(
      Attributes(
        color = ct[:swatch][2:end],
        patchcolor = ct[:swatch][2:end],
      ),
      Makie.DEFAULT_PALETTES, 
    )

    Attributes(
        backgroundcolor = Makie.to_color(ct[:background]),
        palette = palettes,
        color = ct[:swatch][2], # maybe it should be ct[:swatch][1], this is the color to use in absence of grouping
        strokecolor = ct[:swatch][2],
        textcolor = ct[:text][2],
        colormap = Makie.to_colormap(Makie.to_color.(ct[:gradient])),
        Axis = Attributes(
            backgroundcolor = :transparent,
            topspinecolor = Makie.to_color(ct[:line][2]),
            bottomspinecolor = Makie.to_color(ct[:line][2]),
            leftspinecolor = Makie.to_color(ct[:line][2]),
            rightspinecolor = Makie.to_color(ct[:line][2]),
            xgridcolor = Makie.to_color(ct[:gridline]),
            ygridcolor = Makie.to_color(ct[:gridline]),
            xminorgridcolor = Makie.to_color(ct[:gridline]),
            yminorgridcolor = Makie.to_color(ct[:gridline]),
            xtickcolor = Makie.to_color(ct[:line][2]),
            ytickcolor = Makie.to_color(ct[:line][2]),
        ),
        Axis3 = Attributes(
            xspinecolor_1 = Makie.to_color(ct[:line][2]),
            xspinecolor_2 = Makie.to_color(ct[:line][2]),
            xspinecolor_3 = Makie.to_color(ct[:line][2]),
            yspinecolor_1 = Makie.to_color(ct[:line][2]),
            yspinecolor_2 = Makie.to_color(ct[:line][2]),
            yspinecolor_3 = Makie.to_color(ct[:line][2]),            
            zspinecolor_1 = Makie.to_color(ct[:line][2]),
            zspinecolor_2 = Makie.to_color(ct[:line][2]),
            zspinecolor_3 = Makie.to_color(ct[:line][2]),
            xgridcolor = Makie.to_color(ct[:gridline]),
            ygridcolor = Makie.to_color(ct[:gridline]),
            zgridcolor = Makie.to_color(ct[:gridline]),
            xtickcolor = Makie.to_color(ct[:line][2]),
            ytickcolor = Makie.to_color(ct[:line][2]),
            ztickcolor = Makie.to_color(ct[:line][2]),
        ),
        Legend = Attributes(
            framecolor = Makie.to_color(ct[:line][2]),
        ),
        Scatter = Attributes(
            # strokecolor = ct[:swatch],

            # cycle = [:markercolor] => :color, 

        ),
        ScatterLines=(;
          cycle=Cycle([:color, :marker], covary = true),
        ),
    )
end

function default(theme::Symbol; kwargs...)
    return merge(style_beto(; kwargs...), color_beto(theme))
end




"""
    beto(theme::Symbol)

Return a Makie theme based on the `theme` from the `beto` package.

To view a sample image, you can use `MakieThemes.demofigure(beto(theme))`.

Available themes are:

$(join(map(x -> "`:$(string(x))`", beto_colors()), ", ", " and ")).

## Usage:
```julia
Makie.set_theme!(beto(:fresh))
# or
Makie.with_theme(beto(:fresh)) do
    # your plotting code here
end
```
"""
beto(theme) = default(theme)

ColorTheme[:fresh] = Dict(
  :background => "#ffffff",
  :text       => ["#555555", "#111111"],
  :line       => ["#826A50", "#362C21"],
  :gridline   => "#eee4da",
  :swatch     => ["#111111", "#65ADC2", "#233B43", "#E84646", "#C29365", "#362C21", "#316675", "#168E7F", "#109B37"],
  :gradient   => ["#65ADC2","#362C21"]
)

ColorTheme[:earth] = Dict(
  :background => "#36312C",
  :text       => ["#555555", "#F8F8F0"],
  :line       => ["#ffffff", "#827D77"],
  :gridline   => "#504940",
  :swatch     => ["#F8F8F0", "#DB784D", "#95CC5E", "#E84646", "#F8BB39", "#7A7267", "#E1AA93", "#168E7F", "#2B338E"],
  :gradient   => ["#7A7267", "#DB784D"]
)

ColorTheme[:flat] = Dict(
    :background => "#ecf0f1",
    :text       => ["#34495e", "#34495e"],
    :line       => ["#2c3e50", "#7f8c8d"],
    :gridline   => "#bdc3c7",
    :swatch     => ["#34495e", "#3498db", "#2ecc71", "#f1c40f", "#e74c3c", "#9b59b6", "#1abc9c", "#f39c12", "#d35400"],
    :gradient   => ["#f1c40f", "#c0392b"]
)

ColorTheme[:flat_dark] = Dict(
    :background => "#34495e",
    :text       => ["#34495e", "#ecf0f1"],
    :line       => ["#2c3e50", "#7f8c8d"],
    :gridline   => "#46627f",
    :swatch     => ["#ecf0f1", "#3498db", "#2ecc71", "#f1c40f", "#e74c3c", "#9b59b6", "#1abc9c", "#f39c12", "#d35400"],
    :gradient   => ["#f1c40f", "#c0392b"]
)

ColorTheme[:dust] = Dict(
    :background => "#FAF7F2",
    :text       => ["#5b4f41", "#5b4f41"],
    :line       => ["#8d7a64", "#8d7a64"],
    :gridline   => "#E3DDCC",
    :swatch     => ["#555555", "#db735c", "#EFA86E", "#9A8A76", "#F3C57B", "#7A6752", "#2A91A2", "#87F28A", "#6EDCEF"],
    :gradient   => ["#F3C57B", "#7A6752"]
)

ColorTheme[:light] = Dict(
    :background => "#f6f1eb",
    :text       => ["#706f6f", "#706f6f"],
    :line       => ["#dadada", "#785d37"],
    :gridline   => "#dadada",
    :swatch     => ["#785d37", "#62bba5", "#ffb84d", "#aaa488", "#b2432f", "#3a6589", "#9b5672", "#908150", "#373634"],
    :gradient   => ["#62bba5", "#373634"]
)

ColorTheme[:chalk] = Dict(
  :background => "#3c3c3c",
  :text       => ["#3c3c3c", "#ffffff"],
  :line       => ["#ffffff", "#ffffff"],
  :gridline   => "#777777",
  :swatch     => ["#ffffff", "#c2c5be", "#d4dada", "#111111", "#6D8875", "#eaeaea", "#908a78"],
  :gradient   => ["#ffffff", "#111111"]
)

ColorTheme[:lilac] = Dict(
  :background => "#FFFDD0",
  :text       => ["#5f5e3a", "#5f5e3a"],
  :line       => ["#B2B080", "#B2B080"],
  :gridline   => "#E5E4BB",
  :swatch     => ["#555555", "#886EB2", "#C29DFF", "#B2B06E", "#DDE8B2", "#689940", "#B96CBF", "#403F34", "#ffffff"],
  :gradient   => ["#D2B6FF", "#555555"]
)

ColorTheme[:carrot] = Dict(
  :background => "#EC7C47",
  :text       => ["#6C3921", "#ffffff"],
  :line       => ["#AC5B34", "#AC5B34"],
  :gridline   => "#D26F3F",
  :swatch     => ["#6C3921", "#45764A", "#63AB5E", "#ffffff", "#B05D34", "#6C4F41", "#EFAE90", "#109F92", "#47ECDD"],
  :gradient   => ["#FBE2D6", "#45764A"]
)

ColorTheme[:pale] = Dict(
  :background => "#ffffff",
  :text       => ["#444444", "#444444"],
  :line       => ["#d1d1d1", "#eaeaea"],
  :gridline   => "#eaeaea",
  :swatch     => ["#444444", "#de6757", "#EB9050", "#3262AB", "#FF8D7D", "#C8E370", "#C45B4D", "#41a65c", "#5E2C25"],
  :gradient   => ["#C8E370", "#de6757"]
)

ColorTheme[:copper] = Dict(
  :background => "#e1965d",
  :text       => ["#614128", "#0d0905"],
  :line       => ["#614128", "#f4d7c1"],
  :gridline   => "#e9b288",
  :swatch     => ["#0d0905", "#614128", "#AE7448", "#f2f0ee", "#E6C1A4", "#EE6C56", "#208794", "#37AE79", "#5DD2E1"],
  :gradient   => ["#f2f0ee", "#614128"]
)

ColorTheme[:grape] = Dict(
  :background => "#e8ece5",
  :text       => ["#6b3241", "#6b3241"],
  :line       => ["#bbb8ab", "#bbb8ab"],
  :gridline   => "#bbb8ab",
  :swatch     => ["#0b0e0a", "#9b3950", "#f79b57", "#6b3241", "#e65e62", "#9e7587", "#4C8659", "#6B6C69", "#0b0e0a"],
  :gradient   => ["#e5c8cf", "#6b3241"]
)

ColorTheme[:greyscale] = Dict(
  :background => "#ffffff",
  :text       => ["#444444", "#444444"],
  :line       => ["#909090", "#909090"],
  :gridline   => "#D0D0D0",
  :swatch     => ["#000000", "#515151", "#909090", "#D0D0D0", "#444444", "#111111", "#eaeaea", "#666666", "#000000"],
  :gradient   => reverse(Makie.to_colormap(:grayC))
)

ColorTheme[:sky] = Dict(
  :background => "#bfeaf8",
  :text       => ["#59595c", "#59595c"],
  :line       => ["#739EAB", "#ffffff"],
  :gridline   => "#ffffff",
  :swatch     => ["#59595c", "#739EAB", "#2C3639", "#36555E", "#f99e93", "#c43d31"],
  :gradient   => ["#f99e93", "#2C3639"]
)

ColorTheme[:solarized] = Dict(
  :background => "#fdf6e3",
  :text       => ["#586e75", "#586e75"],
  :line       => ["#073642", "#073642"],
  :gridline   => "#eee8d5",
  :swatch     => ["#073642", "#268bd2", "#dc322f", "#2aa198", "#b58900", "#6c71c4", "#d33682"],
  :gradient   => ["#dc322f", "#268bd2"]
)

ColorTheme[:grass] = Dict(
  :background => "#64a756",
  :text       => ["#2F4D28", "#2F4D28"],
  :line       => ["#d6eecb", "#d6eecb"],
  :gridline   => "#a4d98b",
  :swatch     => ["#4A3D4F", "#CEF3C6", "#ded42f", "#B45454", "#3E6735", "#be1d2d", "#57826F"],
  :gradient   => ["#ded42f", "#B45454"]
)

ColorTheme[:sea] = Dict(
  :background => "#27a4f8",
  :text       => ["#27a4f8", "#fcfbf9"],
  :line       => ["#b9c8c3", "#b9c8c3"],
  :gridline   => "#b9c8c3",
  :swatch     => ["#135078", "#f0f0f0", "#F1F14C", "#135078", "#F94240", "#cbe9fd", "#F9A765", "#092639", "#C5430B"],
  :gradient   => ["#f0f0f0", "#092639"],
)

_BlueGreenYellow = ["#1f0266", "#193079", "#175a85", "#197f8c", "#269988", "#3ab082", "#54c279", "#7dd06e", "#afdb63", "#e9e559"]
_LakeColors = ["#4b0f87", "#6237a7", "#795fc8", "#9087e8", "#a1a2e8", "#b2bde9", "#c2d8e9", "#d2dde2", "#e1e2db", "#f0e7d5"]
_DefaultColors=["#e95536", "#5e81b5", "#e19c24", "#8fb032", "#eb6235", "#8778b3", "#c56e1a", "#5d9ec7", "#ffbf00", "#a5609d", "#929600"]
ColorTheme[:math] = Dict(
  :background => "#ffffff",
  :text       => ["#000000", "#111111"],
  :line       => [:gray60, :gray60],
  # :line       => ["#000000", "#362C21"],
  :gridline   => :gray80,#"#eee4da",
  :swatch     => _DefaultColors,#["#111111", "#65ADC2", "#233B43", "#E84646", "#C29365", "#362C21", "#316675", "#168E7F", "#109B37"],
  # :gradient   => ["#f0f0f0", "#9087e8", "#092639"],
  :gradient   => ["#f0f0f0", "#092639"],
)

"""
  rewrites data from a vector of x,y,z data into one acceptable for 
  pm3d in gnuplot. 
  It must have the first column as the variable that states the row 
  break.
"""
function polish_for_gnuplot(_filename::String, _data::Vector)
    x,y,z = getindex.(_data,1),getindex.(_data,2),getindex.(_data,3)
    open(_filename, "w") do io
    last=x[firstindex(x)]
    for index in eachindex(x)
      if last != x[index]
        writedlm(io," ")
      end
      writedlm(io, [x[index] y[index] z[index]])
      last=x[index]
    end
  end
end

function draw_inset!(ax, inset)

	poly!(ax, inset.finallimits, color=(:black,0), strokewidth=1, strokecolor=:black)
	
	shifted_bbox = lift(ax.scene.viewport, inset.layoutobservables.computedbbox,
						ax.scene.camera.projectionview) do px_area, bbox, _
		Rect2f(bbox.origin .- px_area.origin, bbox.widths)
	end

	# scatter!(ax, shifted_bbox, color=:red, space=:pixel)

	vert_edges = [ Observable{Any}() for _ in 1:4 ]
	connect = [ Observable{Bool}() for _ in 1:4 ] 
	onany(inset.finallimits, shifted_bbox) do bbox1, bbox2
		for (i,(c1, c2)) in enumerate(zip(Makie.GeometryBasics.coordinates(bbox1), Makie.GeometryBasics.coordinates(bbox2)))
		cc1 = Makie.project(ax.scene, Point2f(c1))
		vert_edges[i][] = [ cc1, Point2f(c2) ]
		end

        rectlims = vcat(Makie.project(ax.scene, Point2f(inset.finallimits[].origin))..., 
            Makie.project(ax.scene, Point2f(inset.finallimits[].origin.+inset.finallimits[].widths))...) # x0 y0 x1 y1

        x0 = shifted_bbox[].origin[1] > rectlims[1]
        x1 = shifted_bbox[].origin[1] + shifted_bbox[].widths[1] > rectlims[3]
        y0 = shifted_bbox[].origin[2] > rectlims[2]
        y1 = shifted_bbox[].origin[2] + shifted_bbox[].widths[2] > rectlims[4]
        connect[1][] = xor(x0, y0)
        connect[2][] = x1==y0
        connect[3][] = x0==y1
        connect[4][] = xor(x1, y1) 
	end


	notify(inset.finallimits)

	for (c, vs) in zip(connect,vert_edges)
		lines!(ax, vs, color=:grey, space=:pixel, visible=c)
	end
end

