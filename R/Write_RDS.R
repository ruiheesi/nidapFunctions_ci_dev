# This function writes RDS output files in NIDAP Code Workbook.

#' @title Write RDS file 
#' @description This function saves an RDS file as output data
#' @details This method will save data into an RDS file in Code Workbook.
#'
#' @param data data to be saved into an RDS file
#' @param filename filename for RDS file, "out.RDS" by default.
#' 
#' @importFrom FoundrySparkR new.output
#' 
#' @export 
#' 
#' @return NULL


writeRDS <- function(data,
                     filename = "file.RDS"){
  output <- new.output()
  output_fs <- output$fileSystem()
  saveRDS(data, output_fs$get_path(filename, 'w'))
}

