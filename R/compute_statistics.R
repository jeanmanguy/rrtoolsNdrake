#' @title Summarise the iris dataset
#' @param data a data frame
#' @param species a string
#' @export
#' @importFrom dplyr filter select
#' @importFrom tidyr gather
#' @importFrom stats cor
#' @importFrom tibble rownames_to_column as_tibble
compute_statistics <- function(data, species) {
  data %>%
    filter(Species == species) %>%
    select(-Species) %>%
    cor() %>%
    as.data.frame() %>%
    rownames_to_column("species_1") %>%
    as_tibble() %>%
    gather("species_2", "cor", -species_1)
}
