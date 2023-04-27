# This function reorders and prioritizes current packages for NIDAP R session.

#' @title Reorder Packages
#' @description This function detaches all but the main (basic) packages 
#'        pre-loaded in NIDAP Code Workbook and reattaches the current packages
#'        to prioritize them for usage in the active code template.
#' @details This method will detach packages that are not considered basic 
#'        packages required by Palantir's Code Workbook, and reattach new 
#'        packages needed by the current template
#'
#' @param package.list packages currently being used in code template
#' @export 
#' 
#' @return NULL

reorderPackages <- function(package.list) {
  
    basic.packages <- c("package:stats",
                      "package:graphics",
                      "package:grDevices",
                      "package:utils",
                      "package:datasets",
                      "package:methods",
                      "package:base",
                      "package:SparkR",
                      "package:vector",
                      "package:plotly",
                      "package:ggplot2",
                      "package:evaluate",
                      "package:jsonlite",
                      "package:FoundrySparkR",
                      "package:futile.logger",
                      "package:uuid")
    
  package.list <- search()[ifelse(unlist(gregexpr("package:",search()))==1,TRUE,FALSE)]
  package.list <- setdiff(package.list,basic.packages)
  
  #If there are existing non-basic packages, detach them.
  if (length(package.list)>0)  for (package in package.list) detach(package, character.only=TRUE)
  
  packages <- gsub("package:","",package.list)
  
  tidypackage <- c("ggplot2","tidyr","stringr","readr","forcats","dplyr","purrr","tibble")
  
  if(sum(packages == "tidyverse")==1){
    packages <- packages[!packages %in% tidypackage]
  }
  
  for(i in seq_along(packages)){
    attachNamespace(packages[i])
  }
}


