# Use this path for electron build:
mydata <- readxl::read_xlsx("mydata.xlsx")

# mydata <- readxl::read_excel(path = here::here("mydata.xlsx"), na = c("", "NA"))

# mydata_modified <- readxl::read_xlsx(path = here::here("mydata_modified"))

exampleData <- mydata



# Functions
# from https://github.com/ewenharrison/shinyfit/blob/master/server/server0_data.R
## To expand data object list to global environment objects
list2objects = function(.list){
  for (i in 1:length(.list)){
    assign(
      names(.list)[i], .list[[i]],
      envir = .GlobalEnv
    )
  }
}

# Load dataset
## Future option for multiple datasets
# load("data/alldata.rda") %>% 
#   length() -> "dataset_n"

# Expand shinyfit data object
# list2objects(alldata_list)


pivot_module <- function(input, output, session){
  
  df <- starwars %>%
    select_if(is.character)
  
  pivot_vars <- get_pivot_vars(df)
}
