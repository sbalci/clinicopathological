## Page 7c: References for Analysis ----

tabPanel(
  "References for the Analysis",
  
  
  
  tags$h3("Package References Used in Analysis"),
  
  tags$hr(),
  
  tags$b("Download References bib"),
  tags$br(),
  tags$br(),
  
  
  downloadButton(outputId = "downloadbib", label = "Download Bibliography"),
  tags$br(),
  tags$br(),
  tags$hr(),
  
  
  
  
  
  
  tags$h3("Software & Libraries Used"),
  p(
    "The jamovi project (2019). jamovi. (Version 0.9) [Computer Software]. Retrieved from https://www.jamovi.org."
  ),
  p(
    "R Core Team (2018). R: A Language and envionment for statistical computing. [Computer software]. Retrieved from https://cran.r-project.org/."
  ),
  p(
    "Fox, J., & Weisberg, S. (2018). car: Companion to Applied Regression. [R package]. Retrieved from https://cran.r-project.org/package=car."
  ),
  p(
    "Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source Software, 4(43), 1686, https://doi.org/10.21105/joss.01686"
  ),
  p(
    "Data processing was carried out with R (R Core Team, 2019) and the easystats ecosystem (Lüdecke, Waggoner, & Makowski, 2019; Makowski, Ben-Shachar, & Lüdecke, 2019)"
  ),
  tags$br(),
  tags$hr(),
  
  
  
  tags$h3("Session Info"),
  tags$br(),
  verbatimTextOutput("references"),
  tags$br(),
  tags$hr(),
  
  
  
  tags$h3("Packages"),
  tags$br(),
  htmlOutput("packagesreport"),
  tags$br(),
  tags$hr(),
  
  
  tags$h3("Packages"),
  tags$br(),
  htmlOutput("packagesreport2"),
  tags$br(),
  tags$hr(),
  
  
  
  tags$h3("Packages"),
  tags$br(),
  verbatimTextOutput("packagespacman"),
  tags$br(),
  tags$hr()
  
  
  
  
)
