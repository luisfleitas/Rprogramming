corr  <- function (directory, threshhold = 0 ){
  fileNames <- list.files (path = directory, all.files = FALSE, full.names = FALSE)
  corr_vector <- vector(mode = "numeric")
  for (fileName in fileNames)
  {
    
    dataSet <- read.table (fileName, header=TRUE, sep="," )
    
    ok <- complete.cases (dataSet)
    if ( sum (ok) > threshhold ) 
    {
      dataSet <- na.omit (dataSet)
       cor_result <- cor (dataSet$sulfate, dataSet$nitrate) 
      corr_vector <- c ( corr_vector, cor (dataSet$sulfate, dataSet$nitrate) )
    } 
  }
  
  return (corr_vector)
  
}