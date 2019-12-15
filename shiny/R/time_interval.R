# time interval calculation function

time_interval <- function(mydata, SurgeryDate, LastFollowUpDate) {
   mydata %>%
    dplyr::mutate(
      interval = lubridate::interval(
      lubridate::ymd(SurgeryDate),
      lubridate::ymd(LastFollowUpDate)
    )
    )
}
