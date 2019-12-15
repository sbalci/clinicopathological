# install library ----

mypackages <- c("shiny",
                "rlang",
                "rio",
                "reactlog",
                "vroom",
                # "tidyverse",
                "shinythemes",
                "dplyr",
                "readxl",
                "survival",
                "survminer",
                "finalfit",
                "reactable",
                "arsenal",
                "glue",
                "shinyFeedback",
                "lubridate",
                "janitor",
                "remotes"
)

install_pkg <- function(name, ...) {
  if (!requireNamespace(name, quietly = TRUE)) {
    install.packages(name, ...)
  }
}

if (!requireNamespace("purrr", quietly = TRUE)) {
  install.packages("purrr")
}

purrr::map(.x = mypackages, .f = install_pkg)

if (!requireNamespace("report", quietly = TRUE)) {
  remotes::install_github("easystats/report")
}


# Load Library ----


suppressPackageStartupMessages({
  library("shiny")
  library("rlang")
  library("rio")
  library("reactable")
  library("vroom")
  # library("tidyverse")
  library("shinythemes")
  library("dplyr")
  library("readxl")
  library("survival")
  library("survminer")
  library("finalfit")
  library("arsenal")
  library("glue")
  library("reactlog")
  library("shinyFeedback")
  library("lubridate")
  library("janitor")
})
