#' @title Create plan for Drake
#' @param species list of iris species
#' @param ... other arguments for [drake_plan][drake::drake_plan]
#' @export
#' @importFrom drake drake_plan target file_out
#' @importFrom ggplot2 ggsave
#' @importFrom grDevices cairo_pdf
#' @importFrom rmarkdown render
#' @importFrom here here
create_plan <- function(species = c("setosa", "versicolor", "virginica"), ...) {
  drake_plan(
    my_data = rrtoolsNdrake::load_data(), # see `R/load_data.R`
    statistics = target(
      rrtoolsNdrake::compute_statistics(my_data, species), # see `R/compute_statistics.R`
      transform = map(species = !!species)
    ),
    cool_plot = target(
      rrtoolsNdrake::make_plot(statistics, species), # see `R/plot.R`
      transform = map(species)
    ),
    save_plot = target(
      ggsave(
        plot = cool_plot,
        filename = file_out(!!here::here(sprintf("analysis/figures/plot_%s.png", species))),
        width = 4.5,
        height = 4.5
      ),
      transform = map(cool_plot, .id = species)
    ),
    ...
  )
}
