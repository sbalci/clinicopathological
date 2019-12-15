# Pre-Shiny Code ----
library("shiny")
options(shiny.autoload.r = TRUE)

# mydata <- readxl::read_xlsx(path = here::here("mydata.xlsx"))

# mydata <- readxl::read_xlsx(path = here::here("mydata.xlsx"))

mydata <- readxl::read_xlsx("mydata.xlsx")

# mydata_modified <- readxl::read_xlsx(path = here::here("mydata_modified"))

exampleData <- mydata


# UI ----


ui <- navbarPage(
  
  
  title = "histopathR",
  inverse = TRUE,
  collapsible = TRUE,
  selected = "Choose Data",
  fluid = TRUE,
  windowTitle = "Histopathology Research Template & Analysis",
  header = "Histopathology Research Template & Analysis",
  
  # Shiny Extensions & Style ----
  
  theme = shinythemes::shinytheme("spacelab"),
  shinyFeedback::useShinyFeedback(),
  tags$style("#switcher { display:none; }"),
  
  
  p("Work in Progress See About -> Project Section"),
  tags$hr(),
  
  
  
  # Page 1: Choose Data ----
  
  
  
  tabPanel(
    "Choose Data",
    
    
    fluidRow(
      column(
        12,
      
      
      # Select UI Data Type ----
      
      
      sidebarPanel(
      
        radioButtons(
          inputId = "select_data_ui",
          label = "Which Data Do You Want to Use",
          choiceNames = c(
            "Test Data",
            "Upload CSV",
            "Upload Excel"
            # "Upload SPSS",
            # "Upload R Data"
            
          ),
          choiceValues = c("testdata_ui",
                           "csv_ui",
                           "excel_ui"
                           # "spss_ui",
                           # "r_ui"
                           )
        )
        
      ),
      
    
      
      
     
        mainPanel(
        
        # This outputs the dynamic UI component
        uiOutput("test_ui"),
        
        uiOutput("upload_csv_ui"),
        
        uiOutput("upload_excel_ui")
        
        # uiOutput("upload_spss_ui"),
        
        # uiOutput("upload_r_ui")
        
        )
        
      ),
      
    )
    
  ),
  
  
  
  # Page 2: Brief Summary ----
  
  
  tabPanel(
    "Brief Summary",
    
    
    titlePanel("Data Summary"),
    
    sidebarLayout(
      
      sidebarPanel(
        
        # 2 Select ID columns to exclude ----
        
        p("Select Columns to Remove From Summary"),
        selectizeInput(
          inputId = 'IDCols',
          'Select ID Columns',
          choices = NULL,
          selected = NULL,
          multiple = TRUE
        )
        
      ),
      
      
      mainPanel(
        
        # 2 Output: DataFrame Summary ----
    
        # TODO ----
        
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
  
  
  tabPanel("Correlation",
           
           
           
           
           
           tabsetPanel(
             tabPanel("Plot"),
             
             
             tabPanel("Summary"),
             tabPanel("Table")
           )),
  
  
  
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
            choiceNames = c("Already Calculated",
                            "Calculate with two different times"),
            choiceValues = c("ac", "c_diff")
          )
          
          ),
          
          
          wellPanel(# This outputs the dynamic UI component
            
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
          textOutput("comment")
          
          
        )
      ),
      
      
      
      
      
      
    ),
    
    
    # Page 7: About ----
    
    
    navbarMenu(
      "About",
      
      ## Page 7a: Project ----
      
      tabPanel(
        title = "Project",
        
        
        HTML("https://sbalci.github.io/histopathology-template/")
        
        # includeHTML("https://sbalci.github.io/histopathology-template/")
        
        
        
        
        
        
        
        
        
        
      ),
      
      
      ## Page 7b: References ----
      
      
      
      tabPanel(
        "References",
        
        
        
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
      
      
    )
    
    
    
    
  )
  
  
  
  
  # SERVER ----
  
  server <- function(input, output, session) {
    
    
    # read_data <- reactiveVal()
    
    
    # 1 Test Data ----
    
    testdata <- reactive({
      
      mydata
      
    })
    
    
    output$testdata_tab <- reactable::renderReactable({
      mydata <- testdata()
      
      return(
        reactable::reactable(
          mydata,
          bordered = TRUE,
          minRows = 5,
          sortable = TRUE,
          resizable = TRUE,
          filterable = TRUE,
          searchable = TRUE,
          pagination = TRUE,
          paginationType = "numbers",
          showPageSizeOptions = TRUE,
          highlight = TRUE,
          striped = TRUE,
          outlined = TRUE,
          compact = TRUE,
          wrap = FALSE,
          showSortIcon = TRUE,
          showSortable = TRUE
        )
      )
      
    })
    
    
    # read_data <-
    # 
    #   eventReactive(input$test_Button, {
    #   
    #    testdata()
    #   
    # })
    
    
#     observeEvent(input$test_Button, {
# 
# read_data <- testdata()
# 
#     })
    
    # 1 Download Test Data ----
    
    
    output$downloadExample <- downloadHandler(
      filename = function() {
        paste(Sys.Date(), "histopathR", "fakedata.xlsx", sep = "-")
        
      },
      
      content = function(file) {
        rio::export(x = exampleData,
                    file = file,
                    format = "xlsx")
      }
      
    )
    
    
    
    
    
    
    # 1 genUI: Test Data ----
    
    output$test_ui <- renderUI({
      
      if (is.null(input$select_data_ui))
        return()
      
      if(input$select_data_ui == "testdata_ui")
        
          wellPanel(  
            
        p("The analysis will be made with an example data"),
        p("You may download the data to see how an organized data should be"),
        
        tags$b("Download Fake Example Data"),
        tags$br(),
        tags$br(),
        
        downloadButton(outputId = "downloadExample", label = "Download Fake Excel"),
        
        tags$br(),
        tags$br(),
        
        actionButton(inputId = "test_Button", "Approve"),
        p("Click the button to approve using data below"),
        
        tags$br(),
        tags$br(),
        
        tags$h3("Test (Example) Data"),
        reactable::reactableOutput("testdata_tab")

        
          )
    })
    
    
# 1 genUI: Upload csv Data ----
    
output$upload_csv_ui <- renderUI({
      
      if (is.null(input$select_data_ui))
        return()
      
      if(input$select_data_ui == "csv_ui")
        
        wellPanel(  
          
          p("The analysis will be made with your data"),
          p("Upload your data here"),
          

          tags$h3("Upload Your File"),
          tags$br(),
          tags$br(),
          
          # Input: Upload csv file ----
          
          fileInput(
            inputId = "uploaded_csv_file",
            label =  "Upload your own CSV File",
            multiple = FALSE,
            accept = c("text/csv",
                       "text/comma-separated-values,text/plain",
                       ".csv")
          ),
          
          # Horizontal line
          tags$hr(),
          
          # Input: Checkbox if file has header
          checkboxInput("header", "Header", TRUE),
          
          # Input: Select separator
          radioButtons(
            "sep",
            "Separator",
            choices = c(
              Comma = ",",
              Semicolon = ";",
              Tab = "\t"
            ),
            selected = ";"
          ),
          
          # Input: Select quotes
          radioButtons(
            "quote",
            "Quote",
            choices = c(
              None = "",
              "Double Quote" = '"',
              "Single Quote" = "'"
            ),
            selected = '"'
          ),
          
          tags$br(),
          tags$br(),
          
          actionButton(inputId = "csv_Button", "Approve"),
          p("Click the button to approve using data below"),
          
          tags$br(),
          tags$br(),
          
          tags$h3("Uploaded Data"),
          reactable::reactableOutput("uploaded_csv_data_tab")
          
        )
    })
    
    # 1 Uploaded csv Data ----
    
    
    uploaded_csv_data <- reactive({
      
      req(input$uploaded_csv_file)
      
      readr::read_csv2(
        file = input$uploaded_csv_file$datapath,
        # header = input$header,
        # sep = input$sep,
        quote = input$quote,
        na = c("NA", "NaN", "")
      )
      
    })
    
    
    
    output$uploaded_csv_data_tab <- reactable::renderReactable({
     
       mydata <- uploaded_csv_data()
      
      return(
        reactable::reactable(
          mydata,
          bordered = TRUE,
          minRows = 5,
          sortable = TRUE,
          resizable = TRUE,
          filterable = TRUE,
          searchable = TRUE,
          pagination = TRUE,
          paginationType = "numbers",
          showPageSizeOptions = TRUE,
          highlight = TRUE,
          striped = TRUE,
          outlined = TRUE,
          compact = TRUE,
          wrap = FALSE,
          showSortIcon = TRUE,
          showSortable = TRUE
        )
      )
      
    })
    
    
    # read_data <- eventReactive(input$csv_Button, {
    #   uploaded_csv_data()
    # })
    
    
    # 1 genUI: Upload excel Data ----
    
    output$upload_excel_ui <- renderUI({
      
      if (is.null(input$select_data_ui))
        return()
      
      if(input$select_data_ui == "excel_ui")
    
        wellPanel(
        
          
          
          fileInput(
            inputId = "uploaded_excel_file",
            label =  "Upload your own Excel File",
            multiple = FALSE,
            accept = c(".xls",
                       ".xlsx")
          ), 
          
          tags$br(),
          tags$br(),
          
          actionButton(inputId = "excel_Button", "Approve Excel"),
          p("Click the button to approve using data below"),
          
          
          tags$br(),
          tags$br(),
          
          tags$h3("Uploaded Excel Data"),
          reactable::reactableOutput("uploaded_excel_data_tab")
            
        )
    
    })
    
    
    
    # 1 Uploaded Excel Data ----
    
    
    uploaded_excel_data <- reactive({
      
      req(input$uploaded_excel_file)
      
      readxl::read_excel(
        path = input$uploaded_excel_file$datapath
      )
      
    })
    
    
    
    output$uploaded_excel_data_tab <- reactable::renderReactable({
      
      mydata <- uploaded_excel_data()
      
      return(
        reactable::reactable(
          mydata,
          bordered = TRUE,
          minRows = 5,
          sortable = TRUE,
          resizable = TRUE,
          filterable = TRUE,
          searchable = TRUE,
          pagination = TRUE,
          paginationType = "numbers",
          showPageSizeOptions = TRUE,
          highlight = TRUE,
          striped = TRUE,
          outlined = TRUE,
          compact = TRUE,
          wrap = FALSE,
          showSortIcon = TRUE,
          showSortable = TRUE
        )
      )
      
    })
    

#     read_data <- reactiveVal()
#     
#     observeEvent((input$test_Button | input$excel_Button), {
#       
# if(input$test_Button != 0) {
#         
#   read_data <- testdata()
#         
#       } else if (input$excel_Button != 0) {
#         
#         read_data <- uploaded_excel_data()
#       
#         }
#     })

    # TODO ----
    
    
    button_val <- reactiveVal("init")
    
    
    observeEvent(input$test_Button,{

      new_val <- "test"

      button_val(new_val)

    })
    
    observeEvent(input$excel_Button,{

      new_val <- "excel"

      button_val(new_val)

    })
    
    
    output$value55 <- renderText({
      button_val()
    })
    
    
    read_data <- reactiveVal()
    
    
    observe({

      button <- button_val()
      if(button == "excel"){
        read_data(uploaded_excel_data())
      } else if(button == "test" | button == "init"){
        read_data(testdata())
      }
      
    })
    
    

    
    
    # read_data <-
    #   
    #   eventReactive(list(input$test_Button, input$excel_Button), {
    #     
    #     if(!is.null(input$test_Button)){
    #     
    #       out <- testdata()
    #     
    #     } else if(!is.null(input$excel_Button)) {
    #       
    #     out <- uploaded_excel_data()
    #     }
    #     
    #   })
    
    # read_data <- eventReactive(input$excel_Button, {
    # req(input$excel_Button)
    #     uploaded_excel_data()
    # })
        
        
    # 1 genUI: Upload spss Data ----
    
    output$upload_spss_ui <- renderUI({
      
      if (is.null(input$select_data_ui))
        return()
      
      if(input$select_data_ui == "spss_ui")
        
        
        wellPanel(
        
        p("Work in progress SPSS")
      
      # TODO
      
        )
      
    })
    
    # 1 genUI: Upload R Data ----
    
    output$upload_r_ui <- renderUI({
      
      if (is.null(input$select_data_ui))
        return()
      
      if(input$select_data_ui == "r_ui")
        
        wellPanel(
        
        p("Work in progress R")
      
      # TODO
      
        )
      
    })
    
    
    
    # Define Data based on selection ----
    
    
    
    # read_data <- reactive({
    # 
    # if (!is.null(uploaded_excel_data())) {
    #     
    #   read_data <- uploaded_excel_data()
    #     
    #   } else if (!is.null(uploaded_csv_data())) {
    # 
    #     read_data <- uploaded_csv_data()
    #     
    #   } else {
    #             
    #     read_data <- testdata()
    #     
    #   }
    # 
    #   })
    
    
    
      # eventReactive(input$select_data_ui, {
      #              
      # if(input$select_data_ui == "testdata_ui") {
      #   
      #   read_data <-  testdata()
      #   
      # } else if(input$select_data_ui == "csv_ui") {
      #   
      #   read_data <-  uploaded_csv_data()
      #   
      # }
      #   
      # 
      # })
      
      
    
    # Names Data ----
    
    
    observe({
      
      mydata <- read_data()
      
      names_data <- names(mydata)
      
      updateSelectizeInput(session,
                           'IDCols',
                           choices = names_data,
                           server = TRUE)
      
    })
    
    
    
    # 2 Menu: IDColumns Data ----
    
    # updateSelectizeInput(session,
    #                      'IDCols',
    #                      choices = names(mydata),
    #                      server = TRUE)
    # 
    
    
    
    # 2 Func: Remove ID columns from data ----
    
    briefSummaryData <- reactive({
      
      
      id_cols <- input$IDCols
      
      
      if(is.null(input$IDCols)) {
        
        read_data()
        
      } else {
        
        read_data() %>% 
          select(-id_cols)
      }
          
        
      
    })
    

    
    
    # 2 Func: Data Frame Summary ----
    
    
    output$dfsummary <- renderPrint({
      
      mydata <- briefSummaryData()
      
      # names(mydata)
      
      
      myreport <-
        mydata %>%
        select(names(which(
          sapply(mydata, class) == "character" |
            sapply(mydata, class) == "numeric"
        ))) %>%
        report::report(.)

      cat(myreport[["text_full"]])
      
      
    })
    
    
    
    
    # Func: Get Categorical Variables ----
    
    
    observe({
      
      mydata <- read_data()
    
      catVar1 <- 
        
      names(
        which(
          # is.factor(mydata)
          sapply(mydata, class) == "character"
        )
      )
      
      updateSelectInput(session,
                           'survfactor',
                           choices = catVar1
                           )
      
      
    })
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    # Func: Survival Preprocess ----
    
    
    
    # Select: Survival Time ----
    
    
    
    
    # updateVarSelectInput(
    #   session = session,
    #   inputId = 'survivaltime',
    #   label = glue::glue("Survival Time (Should be Numeric)
    #                   (Choose only if you have an already calculated column for survival)"),
    #   data = ,
    #   selected = ""
    # )
    
    
    # updateSelectInput(session = session,
    #                   inputId = 'survivaltime',
    #                   choices = c(Choose = '', namesforselection),
    #                   label = glue::glue("Survival Time (Should be Numeric)
    #                   (Choose only if you have an already calculated column for survival)"),
    #                   selected = "")
    
    
    # Select: Initial Time ----
    
    # updateSelectInput(session = session,
    #                   inputId = 'initialtime',
    #                   choices = c(Choose = '', names(mydata)),
    #                   label = glue::glue("Select Diagnosis (Initial) Time",
    #                                      "(Should be a Date Column)"),
    #                   selected = "")
    
    
    
    # Select: Follow-Up Time ----
    
    # updateSelectInput(session = session,
    #                   inputId = 'lasttime',
    #                   choices = c(Choose = '', names(mydata)),
    #                   label = glue::glue("Select Last Follow-Up Time",
    #                                      "(Should be a Date Column)"),
    #                   selected = "")
    
    
    
    
    # generate UI: Survival ----
    
    

          
      

    
    
    output$surv_time_ui <- renderUI({
      if (is.null(input$input_type))
        return()
      
      if(input$input_type == "ac")
      textInput(inputId = "survivaltime",
                label = "Survival Time",
                value = "OverallTime")
        
    })
    
    
    output$surv_time_ui2 <- renderUI({
      if (is.null(input$input_type))
        return()
      
      if(input$input_type == "c_diff")
        
      wellPanel(  
      selectInput(
          inputId = "initialdate",
          label = "Initial Date",
          selected = "SurgeryDate",
          choices = names(mydata)
        ),
      
      selectInput(
        inputId = "finaldate",
        label = "Follow-up Date",
        selected = "LastFollowUpDate",
        choices = names(mydata)
      )
        )    
    })
    
    
    
    
    
    
    # Define Survival Time ----
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    dataSurvival <- reactive({
      mydata <- read_data()
      
      survcol <- input$survivaltime
      
      mydata$survtime <- mydata[[survcol]]
      
      return(mydata)
      
      # if (input$survivalinfo == NULL) {
      
      # mydata %>%
      #   dplyr::mutate(
      #     survtime = mydata[[survcol]]
      #   )
      
      
      # }
      
      # else {
      #
      #   mydata %>%
      #     dplyr::mutate(int2 = lubridate::interval(
      #       lubridate::ymd(SurgeryDate),
      #       lubridate::ymd(LastFollowUpDate)
      #     )) %>%
      #     mutate(OverallTime =
      #              lubridate::time_length(int2, "month")) %>%
      #     mutate(OverallTime =
      #              round(OverallTime, digits = 1))
      #
      #
      # }
      
      
    })
    
    
    # Func: show modified data ----
    
    output$dfshow_modified <- reactable::renderReactable({
      
      req(input$survivaltime)
      
          
        
        
        mydata <- dataSurvival()
        
        return(
          reactable::reactable(
            mydata,
            bordered = TRUE,
            minRows = 5,
            sortable = TRUE,
            resizable = TRUE,
            filterable = TRUE,
            searchable = TRUE,
            pagination = TRUE,
            paginationType = "numbers",
            showPageSizeOptions = TRUE,
            highlight = TRUE,
            striped = TRUE,
            outlined = TRUE,
            compact = TRUE,
            wrap = FALSE,
            showSortIcon = TRUE,
            showSortable = TRUE
          )
        )   
      
        
      
      
      
      
    })
    
    
    
    # Func: Kaplan-Meier ----
    
    output$KMPlot <-
      
      renderPlot({
        mydata <- dataSurvival()
        
        mydata$Outcome <- mydata$Death
        
        mydata$OverallTime <-
          as.numeric(as.character(mydata$OverallTime))
        
        explanatory <- forcats::as_factor(input$survfactor)
        
        mydata %>%
          finalfit::surv_plot(
            .data = .,
            dependent = "Surv(OverallTime, Outcome)",
            explanatory = explanatory,
            xlab = 'Time (months)',
            pval = TRUE,
            legend = 'none',
            break.time.by = 12,
            xlim = c(0, 60)
          )
        
      })
    
    # Func: Cox-Regression ----
    
    
    output$CoxTable <-
      
      renderTable({
        mydata <- read_data()
        
        mydata$Outcome <- mydata$Death
        
        
        mydata %>%
          finalfit::finalfit("Surv(OverallTime, Outcome)", input$Factor)
        
      })
    
    
    # Func: Median Survival ----
    
    
    output$Median <-
      
      
      renderTable({
        mydata <- read_data()
        
        mydata$Outcome <- mydata$Death
        
        
        formula_text <-
          paste0("Surv(OverallTime, Outcome) ~ ", input$Factor)
        
        km_fit <- survfit(as.formula(formula_text),
                          data = mydata)
        
        km_fit_median_df <- summary(km_fit)
        
        km_fit_median_df <- as.data.frame(km_fit_median_df$table) %>%
          janitor::clean_names() %>%
          tibble::rownames_to_column()
        
      })
    
    
    # Func: Year Survival ----
    
    
    output$YearSurv <-
      
      renderTable({
        mydata <- read_data()
        
        mydata$Outcome <- mydata$Death
        
        
        formula_text <-
          paste0("Surv(OverallTime, Outcome) ~ ", input$Factor)
        
        km_fit <- survfit(as.formula(formula_text),
                          data = mydata)
        
        km_fit_summary <- summary(km_fit, times = c(12, 36, 60))
        
        km_fit_df <-
          as.data.frame(km_fit_summary[c("strata",
                                         "time",
                                         "n.risk",
                                         "n.event",
                                         "surv",
                                         "std.err",
                                         "lower",
                                         "upper")])
        
        km_fit_df
        
      })
    
    
    # Func: YearSurvComment ----
    
    
    
    output$YearSurvComment <-
      
      renderPrint({
        mydata <- read_data()
        
        mydata$Outcome <- mydata$Death
        
        
        formula_text <-
          paste0("Surv(OverallTime, Outcome) ~ ", input$Factor)
        
        km_fit <- survfit(as.formula(formula_text),
                          data = mydata)
        
        km_fit_summary <- summary(km_fit, times = c(12, 36, 60))
        
        km_fit_df <-
          as.data.frame(km_fit_summary[c("strata",
                                         "time",
                                         "n.risk",
                                         "n.event",
                                         "surv",
                                         "std.err",
                                         "lower",
                                         "upper")])
        
        km_fit_df %>%
          dplyr::mutate(
            description =
              glue::glue(
                "When {strata}, {time} month survival is {scales::percent(surv)} [{scales::percent(lower)}-{scales::percent(upper)}, 95% CI]."
              )
          ) %>%
          dplyr::select(description) %>%
          pull() -> comment
        
        print(comment)
        
      })
    
    
    
    
    # Func: Comment ----
    
    output$comment <- renderText(input$comment)
    
    
    # Download Modified Data ----
    
    
    output$downloadModified <- downloadHandler(
      filename = function() {
        paste(Sys.Date(), "histopathR", "modifiedData.xlsx", sep = "-")
        
      },
      
      
      content = function(file) {
        rio::export(x = read_data(),
                    file = file,
                    format = "xlsx")
      }
      
    )
    
    
    
    
    
    # References ----
    
    
    
    output$references <-
      
      renderPrint({
        sessionInfo()
        
      })
    
    
    output$packagesreport <-
      
      renderTable({
        report::cite_packages(session = sessionInfo())
        
      })
    
    
    output$packagesreport2 <-
      
      
      renderTable({
        report::show_packages(session = sessionInfo())
        
        
      })
    
    
    output$packagescitation <-
      
      renderText({
        citation("tidyverse")
        citation("readxl")
        citation("janitor")
        citation("report")
        citation("finalfit")
        citation("ggstatsplot")
        
      })
    
    
    
    # Download References as bib ----
    
    
    output$downloadbib <- downloadHandler(
      filename = function() {
        paste(Sys.Date(), "histopathR", "packages.bib", sep = "-")
      },
      
      
      content = function(file) {
        knitr::write_bib(x = c(.packages(), "knitr", "shiny"),
                         file = file)
        
      }
      
    )
    
    
    
    
    
    
    
    
    
    output$packagespacman <-
      
      renderText({
        pacman::p_loaded(all = TRUE)
        
      })
    
    
    
    
    
    
    
    
    
    
    
  }
  
  
  
  
  # Run the Shiny app ----
  
  shinyApp(ui, server)
  
