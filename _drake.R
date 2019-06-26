devtools::load_all()

plan <- create_plan(species = c("setosa", "versicolor", "virginica"))

drake::drake_config(plan)
