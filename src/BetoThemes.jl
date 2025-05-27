module BetoThemes

using CairoMakie
using Makie: Theme, RGBAf, IntervalsBetween, to_colormap, Cycle, wong_colors
using Makie
using Colors
using LaTeXStrings
using MathTeXEngine
using ColorSchemes

export math, fmt, centered_colormap

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

end # module BetoThemes
