#' @title Create plan for Drake
#' @param param list for the statistics part
#' @param ... other arguments for [drake_plan][drake::drake_plan]
#' @export
#' @importFrom drake drake_plan target file_out
#' @importFrom ggplot2 ggsave
#' @importFrom grDevices cairo_pdf
create_plan <- function(param = NULL, ...) {
  drake_plan(
    my_data = load_data(), # see `R/load_data.R`
    statistics = target(
      compute_statistics(my_data, param), # see `R/compute_statistics.R`
      transform = map(param = !!param)
    ),
    cool_plot = target(
      ggsave(
        plot = make_plot(statistics), # see `R/plot.R`
        filename = file_out(!!sprintf("analysis/figures/plot_%s.pdf", param)),
        width = 5,
        height = 5,
        device = cairo_pdf()
      ),
      transform = map(statistics)
    ),
    ...
  )
}
