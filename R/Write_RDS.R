# This function writes RDS output files in NIDAP Code Workbook.

#' @title Write RDS
#' @description This function saves an RDS file as the output data 
#'        format.
#' @details This method will save RDS data into a template/code transform
#'        in Code Workbook.
#'
#' @param data data to be saved into RDS file
#' @param filename filename for RDS file, "out.RDS" by default.
#' @export 
#' 
#' @return 


writeRDS <- function(data,
                      filename = "out.RDS"){
  output <- new.output()
  output_fs <- output$fileSystem()
  saveRDS(data, output_fs$get_path(filename, 'w'))
}

