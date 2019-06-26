devtools::load_all()

plan <- create_plan()

drake::drake_config(plan)
