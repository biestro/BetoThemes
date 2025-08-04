module BetoThemes

using CairoMakie
using Makie: Theme, RGBAf, IntervalsBetween, to_colormap, Cycle, wong_colors
using Makie
using Colors
using LaTeXStrings
using MathTeXEngine
using ColorSchemes

export math, fmt, centered_colormap, create_fig, create_fig2

include(joinpath(@__DIR__, "plot_utilities.jl"))


"""
  fmt(content::String)

Generates a parsed LaTeX string with a given font for Makie titles.

# Example
```julia
eval(fmt("\\psi_1"))
julia> L"\fontfamily{TeXGyreHeros} ..."
```

"""
function fmt(content::String)
  expr = """L"\\fontfamily{TeXGyreHeros}$content" """
  return eval(Meta.parse(expr))
end

math(s::String) = rich(s, font="Latin Modern Math Regular")

# const FONTSIZE_SMALL  = 14
# const FONTSIZE_MAIN   = 16
# const FONTSIZE_BIG    = 18


"""
    centered_colormap(vmin::Real, vmax::Real; total_steps=256, base_cmap=ColorSchemes.redsblues)

Create a custom `ColorScheme` centered at 0, spanning from `vmin` to `vmax`,
with proportional resolution on each side using the given `base_cmap`.
"""
function centered_colormap(vmin::Real, vmax::Real;
                           total_steps::Int = 256,
                           base_cmap::ColorScheme = ColorSchemes.redsblues)

    if vmin >= 0 || vmax <= 0
        error("vmin must be < 0 and vmax must be > 0 to center at zero.")
    end

    # Total range and proportions
    range_total = vmax - vmin
    neg_proportion = abs(vmin) / range_total
    pos_proportion = vmax / range_total

    # Steps for each side
    neg_steps = Int(round(neg_proportion * total_steps))
    pos_steps = total_steps - neg_steps

    # Get colors from base colormap split at center (0.5)
    lower_half = get(base_cmap, range(0.0, 0.5, length=neg_steps))
    upper_half = get(base_cmap, range(0.5, 1.0, length=pos_steps))

    return ColorScheme(vcat(lower_half, upper_half))
end

# function create_fig(; _dpi = 100,  _size = (3.375, 2.5), _fontsize = 11, kwargs...)
#     width_px = round(Int, _size[1] * _dpi)
#     height_px = round(Int, _size[2] * _dpi)

#     fontsize_px = round(Int, (_fontsize / 72) * _dpi) # pt to px

#     fig = Figure(size = (width_px, height_px), 
#                  fontsize = fontsize_px, 
#                  theme=BetoThemes.default(:math; sw=0.0),
#                  kwargs...)
#     gl = fig[1, 1] = GridLayout()  # cleaner assignment
#     return fig, gl
# end

function create_fig(; _dpi = 100, _size = (3.375, 2.5), _fontsize = 11, _theme = :math, kwargs...)
    width_px = round(Int, _size[1] * _dpi)
    height_px = round(Int, _size[2] * _dpi)

    fontsize_px = round(Int, (_fontsize / 72) * _dpi)  # pt → px

    # Always enforce transparent figure background
    default_fig_kwargs = Dict(
        :backgroundcolor => :transparent,
    )

    # Separate kwargs for Figure vs Theme
    fig_keys = (:backgroundcolor, :figure_padding, :resolution, :font, :fontsize, :tellwidth, :tellheight, :ssao)
    fig_kwargs = merge(default_fig_kwargs, Dict(k => v for (k,v) in kwargs if k in fig_keys))
    theme_kwargs = Dict(k => v for (k,v) in kwargs if !(k in fig_keys))

    # Call your custom theme (which should also make Axis background transparent)
    theme = BetoThemes.default(_theme; dpi=_dpi, theme_kwargs...)

    # Create figure
    fig = Figure(size = (width_px, height_px),
                 fontsize = fontsize_px,
                 theme = theme;
                 fig_kwargs...)

    gl = fig[1, 1] = GridLayout()
    return fig, gl
end


end # module BetoThemes
