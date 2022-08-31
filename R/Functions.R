## ---------------------------
## Title: Barnardo's Brand Visualisations
## Purpose: Creating a function to apply Barnardo's branding to visualisations with ggplot2
## ---------------------------
## Author: Daniel Fellowes
## Date Created: 2022-08-30
## ---------------------------
## Notes:
##   Created with guidance from BBC's bbplot package: https://github.com/bbc/bbplot
##
## ---------------------------

## load required packages with pacman - p_load will load packages and install them if required

# pacman::p_load(dplyr, ggplot2, tidyr, sysfonts, extrafont, showtext)

## ---------------------------

#' Add +theme_barnardos() to a ggplot2 object to apply default Barnardo's branding
#' @export
theme_barnardos <- function() {

  if (!require("sysfonts")) { install.packages("sysfonts") }

  sysfonts::font_add("Clarendon URW", regular = "C:/WINDOWS/FONTS/CLARENDONURW-REG.OTF")
  sysfonts::font_add("Verdana", regular = "C:/WINDOWS/FONTS/VERDANA.TTF")

  if (!require("showtext")) { install.packages("showtext") }

  showtext::showtext_auto()

  # set barnardo's default fonts
  title_font <- "Clarendon URW"
  font <- "Verdana"

  # set barnardo's default colour palette
  options(ggplot2.discrete.colour= list(c("#6aa300", "#cc0070", "#0099a9", "#6e2066", "#e86c00")))
  options(ggplot2.discrete.fill= list(c("#6aa300", "#cc0070", "#0099a9", "#6e2066", "#e86c00")))

  #update_geom_defaults("line", list(size = 1))
  #update_geom_defaults("point", list(size = 2))

  ggplot2::theme(

    # Text format
    # Set font, colour, size and margins for chart title
    plot.title = ggplot2::element_text(family=title_font,
                                       size=36,
                                       colour="#1D1D1D",
                                       margin=ggplot2::margin(t = 3)),
    # Set font, colour, size and margins for chart subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=22,
                                          margin=ggplot2::margin(6,0,6,0)),
    # Set font, colour, size and margins for chart caption
    plot.caption = ggplot2::element_text(family=font,
                                         size=14,
                                         hjust = 1,
                                         margin=ggplot2::margin(6, 4, 2, 2)),

    # Legend format
    # Set default position for chart legend
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_text(family=font,
                                         size=22,
                                         color="#1D1D1D"),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=22,
                                        color="#1D1D1D"),

    # Axis format
    # Set default font, size, and general style for chart axis
    axis.title = ggplot2::element_text(family=font,
                                       size=22,
                                       color="#1D1D1D"),
    axis.text = ggplot2::element_text(family=font,
                                      size=16,
                                      color="#1D1D1D"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
    axis.ticks = element_blank(),
    axis.line = ggplot2::element_blank(),

    # Grid lines
    # Set default grid line style
    panel.grid.minor.y = ggplot2::element_line(color="#e8e8e8"),
    panel.grid.major.y = ggplot2::element_line(color="#d1d1d1", size = 0.5),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.minor.x = ggplot2::element_blank(),

    # Panel background
    # Removes the grey panel background
    panel.background = ggplot2::element_blank(),

    # Facet titles
    # Set default font, size and style for faceted plot titles
    strip.background = ggplot2::element_rect(fill="white"),
    strip.text = ggplot2::element_text(size  = 22,  hjust = 0)
  )
}

