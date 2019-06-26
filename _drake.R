plan <- rrtoolsNdrake::create_plan(
  species = c("setosa", "versicolor", "virginica"),
  output_dir = here::here("analysis/figures/")
)

drake::drake_config(plan, packages = c("rrtoolsNdrake", "ggplot2"))
