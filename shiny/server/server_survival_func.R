# 5 Func: Survival Preprocess ----



# Select: Survival Time ----




# updateVarSelectInput(
#   session = session,
#   inputId = 'survivaltime',
#   label = glue::glue("Survival Time (Should be Numeric)
#   (Choose only if you have an already calculated column for survival)"),
#   data = ,
#   selected = ""
# )


# updateSelectInput(session = session,
#   inputId = 'survivaltime',
#   choices = c(Choose = '', namesforselection),
#   label = glue::glue("Survival Time (Should be Numeric)
#   (Choose only if you have an already calculated column for survival)"),
#   selected = "")


# Select: Initial Time ----

# updateSelectInput(session = session,
#   inputId = 'initialtime',
#   choices = c(Choose = '', names(mydata)),
#   label = glue::glue("Select Diagnosis (Initial) Time",
#      "(Should be a Date Column)"),
#   selected = "")



# Select: Follow-Up Time ----

# updateSelectInput(session = session,
#   inputId = 'lasttime',
#   choices = c(Choose = '', names(mydata)),
#   label = glue::glue("Select Last Follow-Up Time",
#      "(Should be a Date Column)"),
#   selected = "")






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
  #      lubridate::time_length(int2, "month")) %>%
  #     mutate(OverallTime =
  #      round(OverallTime, digits = 1))
  #
  #
  # }
  
  
})






# Func: Kaplan-Meier ----

output$KMPlot <-
  
  renderPlot({
    mydata <- dataSurvival()
    
    mydata$Outcome <- mydata$Death
    
    mydata$OverallTime <-
      as.numeric(as.character(mydata$OverallTime))
    
    explanatory <-
      forcats::as_factor(input$survfactor)
    
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


# Func: Kaplan-Meier highcharter ----


output$KMPlot_highcharter <- highcharter::renderHighchart({
  
  mydata <- dataSurvival()
  
  mydata$Outcome <- mydata$Death
  
  mydata$OverallTime <-
    as.numeric(as.character(mydata$OverallTime))
  
  formula_text <-
    paste0("Surv(OverallTime, Outcome) ~ ", input$survfactor)
  
  km_fit <- survfit(as.formula(formula_text),
                    data = mydata)
  
  
  highcharter::hchart(km_fit, ranges = TRUE)
  
  
  
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
    
    km_fit_median_df <-
      as.data.frame(km_fit_median_df$table) %>%
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
    
    km_fit_summary <-
      summary(km_fit, times = c(12, 36, 60))
    
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
    
    km_fit_summary <-
      summary(km_fit, times = c(12, 36, 60))
    
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


