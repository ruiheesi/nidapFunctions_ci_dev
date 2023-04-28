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
    
    basic.packages <- c("package:stats",
                        "package:graphics",
                        "package:grDevices",
                        "package:utils",
                        "package:datasets",
                        "package:methods",
                        "package:base",
                        "package:SparkR",
                        "package:vector",
                        "package:evaluate",
                        "package:jsonlite",
                        "package:FoundrySparkR",
                        "package:futile.logger",
                        "package:uuid")
    
    package.list <- search()[ifelse(unlist(gregexpr("package:",search()))==1,TRUE,FALSE)]
    package.list <- setdiff(package.list,basic.packages)
    
    #If there are existing non-basic packages, detach them.
    if (length(package.list)>0)  for (package in package.list) detach(package, character.only=TRUE)
    
    #load current packages with option to suppress startup messages
    for(package in current.packages){
      if(suppress == TRUE){
        suppressPackageStartupMessages(library(package, character.only=TRUE))
      } else {
        library(package, character.only=TRUE)
      }
    }
}







