# This function unzips the files brought into NIDAP code workbook.

#' @title Unzip Files in a Loop
#' @description This function unzips specific file(s) in a file path 
#' @details This method will return unzipped file(s) for reading into a code 
#'      workbook template/transform.
#'
#' @param dir File path for zipped data file(s)
#' 
#' @importFrom utils unzip
#' 
#' @export 
#' 
#' @return Local file path for unzipped data file(s)
#' 


loopUnzip <- function(dir){
  while(length(grep(".zip",dir))!=0){
    dir <- unzip(dir)        
  }
  output <- basename(dir)
  return(output)
}