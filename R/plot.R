#' @title Plot the correlation between iris flowers properties for one species
#' @param statistics a data frame
#' @param species a string
#' @export
#' @importFrom ggplot2 ggplot aes geom_tile geom_label scale_fill_distiller theme_minimal theme element_blank coord_equal labs element_text
make_plot <- function(statistics, species) {
  statistics %>%
    ggplot(
      mapping = aes(
      x = species_1,
      y = species_2,
      fill = cor,
      label = round(cor, 2)
      )
      ) +
    geom_tile() +
    geom_label(fill = "white") +
    scale_fill_distiller(palette = "Greens", direction = 1) +
    theme_minimal() +
    theme(
      axis.title = element_blank(),
      plot.subtitle = element_text(face = "italic")
    ) +
    coord_equal() +
    labs(
      title = "Correlation matrix",
      subtitle = paste("Iris", species)
    )
}
