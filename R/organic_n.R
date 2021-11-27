#' Calculate organic nitrogen concentration
#'
#' @param tn Total nitrogen concentration
#' @param no3 Nitrate concentration
#' @param nh3 Ammonia concentration
#' @export

organic_n <- function(tn, no3, nh3){
  tn - (no3 + nh3)
}
