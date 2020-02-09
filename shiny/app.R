# TODO ----

# https://rstudio.github.io/shinytest/articles/ci.html

# Pre-Shiny Code ----
# Library ----
library("dplyr")
library("ggplot2")
source(file.path("R", "get_category_variables.R"))

library("shiny")

suppressPackageStartupMessages({
  library("shiny")
  library("shinyBS")
  library("shinyLP")
  library("shinythemes")
  library("shinyPivot")
})

# Shiny Options ----
options(shiny.autoload.r = TRUE)

# Data ----
source(file.path("server", "server0_data.R"), local = TRUE)$value


# UI ----

ui <- navbarPage(
  title = div(icon("r-project"), "histopathR"),
  inverse = TRUE,
  collapsible = TRUE,
  selected = "Choose Data",
  fluid = TRUE,
  windowTitle = "Histopathology Research Template & Analysis",
  # header = "Histopathology Research Template & Analysis",

  # Shiny Extensions & Style ----

  theme = shinythemes::shinytheme("spacelab"),
  shinyFeedback::useShinyFeedback(),
  tags$style("#switcher { display:none; }"),
  # rintrojs::introjsUI(),

  # Landing Page ----
  tabPanel(
    "Introduction",
    icon = icon("home"),
    source(file.path("ui", "ui_LandingPage1.R"), local = TRUE)$value,
    source(file.path("ui", "ui_LandingPage2.R"), local = TRUE)$value,
    source(file.path("ui", "ui_LandingPage3.R"), local = TRUE)$value,
    tags$head(tags$link(rel = "shortcut icon", href = "favicon.ico")),
    source(file.path("ui", "ui_LandingPage4.R"), local = TRUE)$value
  ),


  # Page 1: Choose Data ----
  tabPanel(
    "Choose Data",
    fluidRow(column(
      12,
      # Select UI Data Type ----
      sidebarPanel(
        radioButtons(
          inputId = "select_data_ui",
          label = "Which Data Do You Want to Use",
          choiceNames = c(
            "Test Data",
            "Upload CSV",
            "Upload Excel",
            "Upload SPSS",
            "Upload General"
          ),
          choiceValues = c(
            "testdata_ui",
            "csv_ui",
            "excel_ui",
            "spss_ui",
            "general_ui"
          )
        )
      ),
      mainPanel(
        # This outputs the dynamic UI component
        uiOutput("test_ui"),
        uiOutput("upload_csv_ui"),
        uiOutput("upload_excel_ui"),
        uiOutput("upload_spss_ui"),
        uiOutput("upload_general_ui")
      )
    ))
  ),



  # Page 2: Brief Summary ----
  tabPanel(
    "Brief Summary",
    icon = icon("cog"),
    titlePanel("Data Summary"),
    sidebarLayout(
      sidebarPanel(
        # 2 Select ID columns to exclude ----
        p("Select Columns to Remove From Summary"),
        selectizeInput(
          inputId = "IDCols",
          "Select ID Columns",
          choices = NULL,
          selected = NULL,
          multiple = TRUE
        )
      ),
      mainPanel(
        # 2 Output: DataFrame Summary ----
        textOutput("value55"),
        p("button"),
        verbatimTextOutput("dfsummary")
      )
    )
  ),

  # Page 3: Descriptives ----

  navbarMenu(
    "Descriptives",
    # Page 3a: Continious ----
    tabPanel("Continious"),
    # Page 3b: Categorical ----
    tabPanel("Categorical"),
    tabPanel("EDA1"),
    tabPanel("EDA2")
  ),

  # Page 4: Correlation ----
  tabPanel(
    "Correlation",
    tabsetPanel(
      tabPanel(
        "Correlation Plot",
        sidebarPanel(
          selectInput("x_variable",
            "Select First Variable",
            choices = NULL
          ),
          selectInput("y_variable",
            "Select Second Variable",
            choices = NULL
          ),
          selectInput("color_variable",
            "Select Color Variable",
            choices = NULL
          )
        ),
        mainPanel(
          plotOutput("scatter_plot"),
          tags$hr(),
          highcharter::highchartOutput("scatter_plot_highcharter"),
          
          
          )
      ),

      tabPanel(
        "Correlation Matrix",
        sidebarPanel(
          p("Select Columns to Remove From Table"),
          selectizeInput(
            inputId = "corr_mat_Cols",
            "Select Columns",
            choices = NULL,
            selected = NULL,
            multiple = TRUE
          )
        ),

        mainPanel(
          tags$h3("Correlation Matrix"),
          tableOutput("corr_matrix"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Matrix"),
          highcharter::highchartOutput("corr_highcharter"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Summary"),
          tableOutput("corr_summary"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Summary 2"),
          verbatimTextOutput("corr_summary2"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Plot"),
          plotOutput("corr_plot"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("References"),
          p("https://easystats.github.io/correlation/"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Matrix"),
          verbatimTextOutput("psy_cor_tab"),
          tags$br(),
          tags$br(),
          tags$hr(),
          verbatimTextOutput("psy_cor_sum"),
          tags$h3("Correlation Matrix"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Matrix"),

          plotOutput("psy_cor_plot"),
          tags$br(),
          tags$br(),
          tags$hr(),
          tags$h3("Correlation Matrix"),

          verbatimTextOutput("psy_cor_pr"),
          tags$br(),
          tags$br(),
          tags$hr()
        )
      )
    )
  ),

  # Decision ----

  tabPanel(
    "Test Statistics",

    source(file.path("ui", "decision_ui_sliders.R"), local = TRUE)$value,
    tags$hr(),
    source(file.path("ui", "decision_ui_table1.R"), local = TRUE)$value,
    tags$hr(),
    source(file.path("ui", "decision_ui_table2.R"), local = TRUE)$value
  ),

  navbarMenu(
    "Pivot",
    # Pivot 1 ----

    tabPanel(
      "Pivot Table 1",

      p("Pivot Table 1"),
      source(file.path("ui", "ui_pivot1.R"),  local = TRUE)$value
    ),


    # Pivot 2 ----
    tabPanel(
      "Pivot Table 2",
      source(file.path("ui", "ui_pivot2.R"), local = TRUE)$value
    )
  ),


  # Page 5: ROC ----
  tabPanel(
    "ROC",
    navlistPanel(
      "Header A",
      tabPanel("Component 1"),
      tabPanel("Component 2"),
      "Header B",
      tabPanel("Component 3"),
      tabPanel("Component 4"),
      "-----",
      tabPanel("Component 5")
    )
  ),


  # Page 6: Survival ----
  tabPanel(
    "Survival",
    ## Sidebar layout with input and output definitions ----
    sidebarLayout(
      fluid = TRUE,
      position = "right",

      # Sidebar panel for inputs ----
      sidebarPanel(
        # Change Survival UI ----
        wellPanel(
          radioButtons(
            inputId = "input_type",
            label = "Survival Info",
            choiceNames = c(
              "Already Calculated",
              "Calculate with two different times"
            ),
            choiceValues = c("ac", "c_diff")
          )
        ),
        wellPanel( # This outputs the dynamic UI component

          uiOutput("surv_time_ui"),
          uiOutput("surv_time_ui2")
        ),

        # Input: Select Survival Time ----


        # textInput(
        #   inputId = 'survivaltime',
        #   'Write Column Name of Survival Time',
        #   value = "OverallTime"
        #
        # ),


        # selectizeInput(
        #   inputId = 'survivaltime',
        #   'Select Survival Time',
        #   choices = NULL,
        #   selected = NULL
        # ),


        # Input: Select Diagnosis Time ----

        # selectizeInput(
        #   inputId = 'initialtime',
        #   'Select Diagnosis (Initial) Time',
        #   choices = NULL,
        #   selected = NULL
        # ),


        # Input: Select Folow-up Time ----

        # selectizeInput(
        #   inputId = 'lasttime',
        #   'Select Last Follow-up or Death Column',
        #   choices = NULL,
        #   selected = NULL
        # ),

        # Input: Select Survival Factor ----

        selectInput(
          inputId = "survfactor",
          label = "Choose a Factor Affecting Survival",
          choices = NULL
        ),

        # Input Comments ----

        textAreaInput(
          inputId = "comment",
          label = "Comments",
          placeholder = "Add comments here"
        )
      ),

      # Survival: Main panel for displaying outputs ----

      source(file.path("ui", "ui_survival_mainPanel.R"), local = TRUE)$value
    )
  ),


  # Page 7: About ----

  
  navbarMenu(
    "Trials",
    icon = icon("info-circle"),
    
        source(file.path("ui", "ui_trial1.R"), local = TRUE)$value
    
    
  ),
  
  

  navbarMenu(
    "About",
    icon = icon("info-circle"),

    # UI About Page ----
    ## Page 7a: Project ----
    source(file.path("ui", "ui_aboutPage_project.R"), local = TRUE)$value,
    ## Page 7b: References for the App ----
    source(file.path("ui", "ui_aboutPage_ref_app.R"), local = TRUE)$value,
    ## Page 7c: References for Analysis ----
    source(file.path("ui", "ui_aboutPage_ref_analy.R"), local = TRUE)$value
  )
)




# SERVER ----

server <- function(input, output, session) {
  # Observe Values ----
  source(file.path("server", "server_observe.R"), local = TRUE)$value
  # Download Buttons ----

  source(file.path("server", "server_downloadButtons.R"), local = TRUE)$value


  # Reactive Values ----

  source(file.path("server", "server_reactiveValues.R"), local = TRUE)$value


  # Tables ----

  source(file.path("server", "server_tables.R"), local = TRUE)$value

  # Plots ----

  source(file.path("server", "server_plots.R"), local = TRUE)$value


  # genUI 1 test ----

  source(file.path("server", "server_test_ui.R"), local = TRUE)$value


  # genUI 1 csv ----

  source(file.path("server", "server_csv_ui.R"), local = TRUE)$value


  # genUI 1 excel ----

  source(file.path("server", "server_excel_ui.R"), local = TRUE)$value

  # genUI 1 spss ----
  
  source(file.path("server", "server_spss_ui.R"), local = TRUE)$value
  
  # genUI 1 general ----
  
  source(file.path("server", "server_general_ui.R"), local = TRUE)$value
  
  source(file.path("server", "server_general_upload.R"), local = TRUE)$value
  
  # Func: read_data

  source(file.path("server", "server_read_data.R"), local = TRUE)$value


  # 2 Brief Summary ----

  source(file.path("server", "server_brief_summary.R"), local = TRUE)$value

  # genUI: Survival  ----
  source(file.path("server", "server_survival_ui.R"), local = TRUE)$value

  # Func: Survival ----
  source(file.path("server", "server_survival_func.R"), local = TRUE)$value


  # Func: Correlation ----
  source(file.path("server", "server_correlation.R"), local = TRUE)$value



  # Comments ----
  source(file.path("server", "server_comments.R"), local = TRUE)$value

  # Decision ----
  source(file.path("server", "decision_server_table.R"), local = TRUE)$value

  # Pivot 1 ----
  source(file.path("server", "server_pivot1.R"),  local = TRUE)$value

  # Pivot 2 ----
  source(file.path("server", "server_pivot2.R"), local = TRUE)$value



  # References ----
  source(file.path("server", "server_references.R"), local = TRUE)$value
}


# Run the Shiny app ----

shinyApp(ui, server)
