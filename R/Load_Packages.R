# This code will help load packages with options to turn messages off.

#' @title Load Packages in NIDAP
#' @description This function will load packages while suppressing startup 
#'        messages by default.
#' @details This method provides a way to automatically (optionally) suppress 
#'        package startup messages in NIDAP
#'
#' @param current.package vector of packages that are being used in the template
#' @param suppress boolean to suppress messages.  By default set to TRUE
#' 
#' @export 
#' 
#' @return NULL

loadPackages <- function(current.packages,
                         suppress = TRUE
                         ){
    for(package in current.packages){
      if(suppress == TRUE){
        suppressPackageStartupMessages(library(package, character.only=TRUE))
      } else {
        library(package, character.only=TRUE)
      }
    }
}







