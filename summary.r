pollutantmean  <- function (directory, pollutant,  id = 1:332 ){
 
  setwd (directory)
  
  for (fileId in id)
  {
    fileName <- paste (replicate ( 3-nchar (fileId),"0"), collapse ='')
    fileName <- paste (fileName, fileId,".csv", sep="")
    
    # if the merged dataset doesn't exist, create it
    if (!exists("dataset")){
      dataset <- read.csv(file = fileName, header = TRUE)
    }
    else 
    {
      temp_dataset <-read.csv(file = fileName, header = TRUE)
      dataset<-rbind(dataset, temp_dataset)
    }
  }
  
  mean (dataset [,pollutant], na.rm = TRUE)
  
}