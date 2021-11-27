#' Calculate light percentage from surface at a discrete depth
#'
#' @param light_at_depth Light measurement at discrete depth, mmol
#' @param light_at_surface Light measurement at surface, mmol
#' @export

light_percentage <- function(light_at_depth, light_at_surface){
  round((light_at_depth / light_at_surface) * 100, 1)
}
