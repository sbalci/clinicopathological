# time interval calculation function

#' Title
#'
#' @param mydata 
#' @param SurgeryDate 
#' @param LastFollowUpDate 
#'
#' @return
#' @export
#'
#' @examples
time_interval <- function(mydata, SurgeryDate, LastFollowUpDate) {
   mydata %>%
    dplyr::mutate(
      interval = lubridate::interval(
      lubridate::ymd(SurgeryDate),
      lubridate::ymd(LastFollowUpDate)
    )
    )
}
