complete <- function (directory, id = 1:332){
  setwd(directory) 
  results <- matrix (ncol =2, nrow=0 )
  colnames(results) <- c ("id","nobs") 
  for (fileId in id)
  {
    fileName <- paste (replicate ( 3-nchar (fileId),"0"), collapse ='')
    fileName <- paste (fileName, fileId,".csv", sep="")
    
    dataSet <- read.table (fileName, header=TRUE, sep="," )
    
    dataSet <- na.omit(dataSet)
    numerOfRows <- nrow (dataSet)
    newRow <- matrix(data = c(fileId, numerOfRows), ncol=2, nrow=1)
    rownames (newRow) <- c(fileId)
     
    results <- rbind(results,newRow)
  
  }
  results
  
}