# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:3.6.0

# required
MAINTAINER Your Name <your_email@somewhere.com>

COPY . /rrtoolsNdrake

# go into the repo directory
RUN . /etc/environment \

  # Install linux depedendencies here
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev -y

  # build this compendium package
  && R -e "devtools::install('/rrtoolsNdrake', dep=TRUE)" \
  && R -e "install.packages(c('here', 'knitr', 'drake', 'sessioninfo'))" \

  # render paper
  && R -e "rmarkdown::render('/rrtoolsNdrake/analysis/analysis.Rmd')"
