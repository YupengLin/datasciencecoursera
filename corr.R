corr <- function(directory, threshold=0){
 data <- data.frame()
 correlation <- vector(mode="numeric",length=0)

 for (index in 1:332){
 	fileName <- formatC(index, width=3, flag=0)
 	filePath <- paste(directory, paste(fileName,"csv",sep="."),sep="/")
 	singleFile <- read.csv(filePath)
 	storage <- data.frame()
  acceptedRow <- vector(mode="numeric",length=0)
    count <- 0
    for (row in 1:nrow(singleFile)){
    	t1 <- is.na(singleFile[row,]["Date"])
    	t2 <- is.na(singleFile[row,]["sulfate"])
    	t3 <- is.na(singleFile[row,]["nitrate"])

    	if(t1==FALSE & t2==FALSE & t3==FALSE){
    		count <- count +1
        acceptedRow <- c(acceptedRow,row)
    	#	storage <- rbind(storage, c(singleFile[row,]["sulfate"],singleFile[row,]["nitrate"]))
    	}
    }
 	if(count>=threshold){
   #  print(paste("count=",threshold))
 	 for(row in 1: length(acceptedRow)){
      storage <- rbind(storage,c(singleFile[acceptedRow[row],]["sulfate"],singleFile[acceptedRow[row],]["nitrate"]))
 	 }
  corPara <- cor(storage$sulfate,storage$nitrate)

  correlation <- c(correlation,corPara)
 	}

 }
   correlation

}