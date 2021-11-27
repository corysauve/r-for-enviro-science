#' Calculate the one percent light level
#'
#' @param depths Profile depths, vector
#' @param light Light measurements, mmol, vector
#' @export

one_percent_light <- function(depths, light){

  # Determine surface and one percent light
  surface_light <- light[[1]]
  one_percent <- surface_light * 0.01

  # Remove zeros and determine length
  light1 <- light[!light %in% 0]
  len <- length(light1)

  # Make depth vector sample length
  depths1 <- depths[1:len]

  # Calculate one percent light level
  mod <- stats::lm(depths1 ~ log(light1))
  coef <- coef(mod)
  int <- coef[1]
  slope <- coef[2]

  slope * log(one_percent) + int
}

