#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0 | !('development' %in% ls())){
development<-F
}else{
development<-args[1]
}

if (development){
Word.g<-matrix(sample(letters, 2500, replace=T), nrow=50)
}else{
Word.g<-matrix(sample(LETTERS, 2500, replace=T), nrow=50)

}

scrambled.months<- toupper(month.name[sample(1:12, replace=F)])



address.x<-c()
address.y<-c()

for (i in 1:12){
		
	if(i==1 | i==5){
		Word.g<-t(Word.g)
	}
  current.month <-scrambled.months[i]
  current.month <-unlist(strsplit(current.month, split=""))
  l<-length(current.month)
  l.minus.50<- 50-l
  
 	sample.x<-sample(setdiff(1:(l.minus.50), address.x), 1, replace=F)
 	
 	sample.y<-sample(setdiff(1:(l.minus.50), address.y), 1, replace=F)
 	address.x<-c(address.x, sample.x)
 	address.y<-c(address.y, sample.y)
 	
 	current.address<-c(sample.x, sample.y)
		
		
		for (j in current.month){
		  
			if(i <= 4){
			  
				current.address[1]<- current.address[1]+1
				
				}
			else if(i <= 8){
				current.address[2]<- current.address[2]+1
				
			}
			else if (i >= 9) {
			  
				current.address <- current.address+1
				
			}
		  address.x <- c(address.x, current.address[1])
		  address.y <- c(address.y, current.address[2])
		  
			Word.g[current.address[1], current.address[2]] <- j 			
			}
			}
#rm(list=grep('[^Word\\.g]', ls(),value = T))
final<-c()
 for (i in 1:50){
 	final<-c(final, paste0(Word.g[i,], collapse=" "))
 }
 write.table(final,"Word Puzzle Challenge.txt",sep="\\n", col.names=F, row.names=F, quote = F)
