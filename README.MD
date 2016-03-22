#What does this R script does?

It creates a 50 by 50 matrix of random letters, if it is run as a "normal mode" the matrix will contain uppercase letters. But in developer mode, it will contain lower case letters.

The matrix will be injected randomly with three uppercase month names in horizontal position, three different uppercase month names in vertical position and the three remaining month names in diagonal position (from left up to right down)

Finally, it will create a text file named "Word Puzzle Challenge.txt" that will contain the matrix that will represent a puzzle

Notice that no external libraries were used!!


#How to run this project for normal users
1- Install R: **R must be installed to run this project**.  R must be downloaded and installed from https://cran.r-project.org/
2- Running from R:

    source('/address/where/the/file/is/located/')  #Notice that forward slash indicate the directories: this is valid in ANY OS (even in Windows)

3- Running from the command line
	
Just run this command in the same directory were the file is placed! If it doesn't work you must add R to the PATH variable!

    Rscript word.game.R

#How to run this project in development mode 
1- Install R: **R must be installed to run this project**. R must be downloaded and installed from https://cran.r-project.org/

2- Running from R
   
   #First create a varible called "development and set it to TRUE"
   development <- T
   #Then run the source file 
   source('/address/where/the/file/is/located/')#Notice that forward slash indicate the directories: this is valid in ANY OS (even in Windows)

3- Running from the command line

Just run this command in the same directory were the file is placed! If it doesn't work you must add R to the PATH variable!

    Rscript -vanilla word.game.R T




