#' @title Load the Iris dataset
#' @export
#' @importFrom tibble as_tibble
load_data <- function() {
  as_tibble(datasets::iris)
}
