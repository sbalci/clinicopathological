mainPanel(
  # Output: Kaplan-Meier ----
  
  tags$br(),
  tags$h3("Kaplan-Meier Plot, Log-Rank Test"),
  tags$br(),
  tags$hr(),
  plotOutput("KMPlot"),
  tags$br(),
  tags$br(),
  tags$hr(),
  tags$br(),
  highcharter::highchartOutput("KMPlot_highcharter"),
  tags$br(),
  tags$br(),
  tags$hr(),
  tags$br(),
  tags$h3("Univariate Cox-Regression"),
  tags$br(),
  tags$hr(),
  tableOutput("CoxTable"),
  tags$br(),
  tags$br(),
  tags$hr(),
  tags$br(),
  tags$h3("Median Survival"),
  tags$br(),
  tags$hr(),
  tableOutput("Median"),
  tags$br(),
  tags$br(),
  tags$hr(),
  tags$br(),
  tags$h3("1-3-5-yr Survival"),
  tags$br(),
  tags$hr(),
  tableOutput("YearSurv"),
  tags$br(),
  tags$br(),
  tags$hr(),
  tags$br(),
  tags$h3("Comment 1-3-5-yr Survival"),
  tags$br(),
  tags$hr(),
  textOutput("YearSurvComment"),
  tags$br(),
  tags$br(),
  tags$hr(),
  tags$br(),
  
  # Output: comment ----
  
  tags$h3("My Comments"),
  textOutput("comment_survival")
  
  
)
