mainPanel(
p("Pivot Table 2"),
selectizeInput(
    inputId = 'pivot2Cols',
    'Select ID Columns',
    choices = NULL,
    selected = NULL,
    multiple = TRUE
  ),
  rpivotTable::rpivotTableOutput("pivot2")
)
