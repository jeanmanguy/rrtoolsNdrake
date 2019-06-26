devtools::load_all()

plan <- create_plan(param = c("a", "b"))

drake::drake_config(plan)
