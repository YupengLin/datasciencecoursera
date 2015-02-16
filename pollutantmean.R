pollutantmean <- function(directory,pollutant, id = 1:332){
  
 
  data <- data.frame()
  for( index in id){
     fileName <- formatC(index,width=3, flag=0)
     filePath <- paste(directory,paste(fileName,"csv", sep ="."),sep="/")
     currentCSV <- read.csv(filePath)
     data <-rbind(data, currentCSV)
  }

  if (pollutant == "sulfate"){
      mean(data$sulfate, na.rm=TRUE)
  }else {
     
      mean(data$nitrate, na.rm= TRUE)
     
  }
}
