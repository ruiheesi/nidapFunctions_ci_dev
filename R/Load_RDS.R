# This function reads RDS when provided as transform input files Code Workbook.

#' @title Load Data
#' @description This function loads specifically an RDS file as the input data 
#'        format.
#' @details This method will import RDS data into a template/code transform
#'        in Code Workbook.
#'
#' @param input transorm input data to import
#' @param name name of rds file
#' @param type data type, by default, 'r'.
#' 
#' @importFrom base readRDS
#' 
#' @export 
#' 
#' @return data read from the rds file

loadRDS <- function(input,
                     name,
                     type = 'r'){
  
  fs <- input$fileSystem()
  path <- fs$get_path(name, type)
  data <- readRDS(path)
  return(data)
}



