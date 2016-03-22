#In R the vector letters contains all the letters in the English alphabet in lower case
#The vector LETTERS contains all the letters in the English alphabet in upper case
# Documentation in R can be called with the sintax ?R.object
#?LETTERS calls the "Build-in Constant" documentation that reads
##Regarding LETTERS the documentation reads: "LETTERS: the 26 upper-case letters of the Roman alphabet"
##Regarding letters the documentation reads: "letters: the 26 lower-case letters of the Roman alphabet" (used in the debug version)
##Regarding month.name (that we will use later) the documentation reads: "month.name: the English names for the months of the year" 

#Since I use the sample function, the documentation reads:
##"Description: sample takes a sample of the specified size from the elements of x using either with or without replacement"
##"Usage: sample(x, size, replace = FALSE, prob = NULL)"

#I am using the parameters x, size and replace, regarding them,
#The documentation reads:
##"x: Either a vector of one or more elements from which to choose ..."(other irrelevant stuff!)
##"size: a non-negative integer giving the number of items to choose"
##"replace:Should sampling be with replacement?"
###replace requires a "logical parameter"
##In R the logical variables (in other languages called "booleans") are TRUE or T and FALSE or F


#BTW the symbol "<-" is an assignment operator in R

letter.sample <-sample(LETTERS, 2500, replace=T)

#Regarding the matrix function, the documentation reads
##"Description matrix creates a matrix from the given set of values"
##"Usage: matrix(data = NA, nrow = 1, ... [other irrelevant parameters])"
##"data: an optional data vector (including a list or expression vector)..." (other irrelevant stuff), 
###data parameter here is letter.sample which it is already a vector, described in line 5 (for debug I used letters)
##"nrow: the desired number of rows." Since the size of letter.sample is 2500 (which it is 50*50)..
##..the number of columns will be 50, since the number of rows is also 50.
#Word.g is a large 50 by 50 matrix of random uppercase letters
Word.g<-matrix(data=letter.sample, nrow=50)

#The documentation of month.name is already described in line 6, it is just a vector of the name of the month in English, which are capitalized
#The documentation of toupper shows the "Character Translation and Casefolding" documentation
#in the description it reads the following
##"tolower and toupper convert upper-case characters in a character vector to lower-case, or vice versa..."
#It means that the new vector character vector (Scrambled.months) will be converted to uppercase
##About the backets
###in R the integers separated by a colon creates a numeric vector starting from the first to the last number
###It means that 1:12 creates a vector c(1,2,3,4,5,6,7,8,9,10,11,12)
###The expression sample(1:12, replace=F) will create a numeric vector if the integer 1 to 12 in a random order!
###Putting the expression in square bracket after month.name
###will order create a new vector of its first 12 elements (it has 12 elements) in a random order!
###Notice that I start with 1, because R vectors and list are 1-based! not 0-based that the most of the other programming languages
scrambled.months<- toupper(month.name[sample(1:12, replace=F)])

#c is a common function it creates a vector of the R objects separated by commas as mentioned in line 43
#address.x and address.y are empty vectors that will be populated by the for loop below
address.x<-c()
address.y<-c()

#Yup! for loops exists in R! blocks are defined by curly braces {}

for (i in 1:12){
	#Indeed if statements also exists in R, blocks are also defined by curly braces, but they are not required for a single line statement
    #The i is an index of the for loop defined in line 57
	if(i==1 | i==5){
        #To properly switch from horizontal to vertical, 
        #It is needed to change a side of the matrix
		Word.g<-Word.g[1:50, 50:1]
	}
  #Here we take a month from the scrambled.months vector  
  current.month <-scrambled.months[i]
  #The expression strsplit(current.month, split="") breaks down the word in contained in the variable current.month to a vector of characters
  #In R character variable can contain either strings or characters
  current.month <-unlist(strsplit(current.month, split=""))
  #The length function tells us the number of elements in a vector (as it happens in other programming languages)
  l<-length(current.month)
  #Ok the sing - is the minus operator
  l.minus.50<- 50-l
    #We already have seen this before, however not the setdiff function 
    #The setdiff function extract the asymetric different between two sets (oops, I mean vectors!)
    #The idea to use this function is to NOT select an already taken position in the matrix!
 	sample.x<-sample(setdiff(1:(l.minus.50), address.x), 1, replace=F)
 	sample.y<-sample(setdiff(1:(l.minus.50), address.y), 1, replace=F)
    #Here I add data of already taken indices of the matrix in this variable
 	address.x<-c(address.x, sample.x)
 	address.y<-c(address.y, sample.y)
 	
 	current.address<-c(sample.x, sample.y)
		
		#Another for loop it is just thru the letters in the current.month variable
        #It also adds every pair of indices to the matrix already taken
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
		  #Here each letter from the current.month variable is injected to the matrix Word.g
			Word.g[current.address[1], current.address[2]] <- j 			
			}
			}
#Ah rm! in R the function R destroys a given element in its list parameters (like the bash)
#Oh ls() create a character vector that contains ALL of the elements in the R environment
#grep() (another recollection from the bash!), grep takes 2 obligatory parameters: pattern (a regular expression) and x a vector character (in our case "ls()") to be evaluated.
##In R the scape character is \\ and NOT \, the other metacharacters are the same as used in other languages!
###the regex '[^Word\\.g] means that you should exclude from the search "Word.g"
rm(list=grep('[^Word\\.g]', ls(),value = T))
#Here I a vector with a heading!
final<-c('Game Dev Challenge: Word Puzzles','Find the month names in the grid below', 'Written by: Hedley Knewjen Quintana', "")
#A third for loop
 for (i in 1:50){
    
    #This loop will convert each row of the Word.g matrix in a single string of letters separated by spaces
    #then each of this string will be added as an element of the final vector!
 	final<-c(final, paste0(Word.g[i,], collapse=" "))
 }
 #Here final vector will be written in the file Word Puzzle Challenge.txt.
 ##The parameter "\\n" means that each string will be separated by a line break: col.names, row.names and 
 ##quote gives unnecesary information that won't be included in the final text file
 write.table(final,"Word Puzzle Challenge.txt",sep="\\n", col.names=F, row.names=F, quote = F)
