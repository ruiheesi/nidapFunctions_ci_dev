# This function creates the file paths for loading into NIDAP code workbook.

#' @title Get file paths
#' @description This function gets specific file paths for loading files into 
#'        NIDAP
#' @details This method will copy files to compute node for reading and returns
#'        the file path for reading into code workbook.
#'
#' @param dataset Data usually in transform input format to import
#' @param ext Extension of file, for instance, xlsx, csv, txt, RDS.
#' @param type Data type, by default, 'r'.
#' @export 
#' 
#' @return File path to read into code template/transform 
#' 

getFilePath <- function(data,
                        ext,
                        type = 'r'){
  fs <- x$fileSystem()
  filepath <- fs$ls(glob = paste0("*.",ext))
  files <- lapply(filepath, function(file) { return(c(file$path, fs$get_path(file$path, type))) })
  output_names<-list()
  for (item in files){
    file.copy(from=item[2], to=item[1], 
              overwrite = TRUE, recursive = FALSE, 
              copy.mode = TRUE)
    output_names <- append(output_names,item[1])
  }
  return(unlist(output_names))
}

