complete <- function(directory, id=1:332){
  data <- data.frame()
  report <- data.frame()
  
  for(index in id){
    fileName <- formatC(index, width=3,flag=0)
    filePath <- paste(directory,paste(fileName,"csv",sep="."),sep="/")
    singleFile <- read.csv(filePath)
    count <- 0
    for(row in 1:nrow(singleFile)){
      
      t1 <-is.na(singleFile[row,]["Date"])    
      t2 <-  is.na(singleFile[row,]["sulfate"])
      t3<-  is.na(singleFile[row,]["nitrate"])
      
      if ( t1==FALSE & t2==FALSE & t3==FALSE  ){
        count <- count+1
      }
 
    }
    report <- rbind(report,c(index, count))
    
  }
  colnames(report) <- c("id", "nobs")
  report
  
  
  
}