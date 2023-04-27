# This function unzips the file paths for loading into NIDAP code workbook.

#' @title Unzip files
#' @description This function unzips specific file paths for loading files into 
#'        NIDAP
#' @details This method will unzip files for reading and returns
#'        the unzipped file path for reading into code workbook.
#'
#' @param dir File path for zipped data file
#' 
#' @importFrom utils unzip
#' @importFrom base basename
#' 
#' @export 
#' 
#' @return Local file path for unzipped data file
#' 


loopUnzip <- function(dir){
  while(length(grep(".zip",dir))!=0){
    dir <- unzip(dir)        
  }
  output <- basename(dir)
  return(output)
}