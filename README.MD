#What does this R script does?

It creates a 50 by 50 matrix of random uppercase letters.

The matrix will be injected randomly with three uppercase month names in horizontal position, three different uppercase month names in vertical position and the three remaining month names in diagonal position (from left up to right down)

Finally, it will create a text file named "Word Puzzle Challenge.txt" that will contain the matrix that will represent a puzzle

Notice that no external libraries were used!!


#How to run this script
##Install R:

    **R must be installed to run this project**.  R must be downloaded and installed from https://cran.r-project.org/

##After R is installed, you have the following options

1- Running from the R gui File->Open Script->Select the script wherever it is in your computer

2- Running from R:

    ```
    #Notice that forward slash indicate the directories: this is valid in ANY OS (even in Windows)
    source('/address/where/the/file/is/located/word.game.R')
    ```

3- Running from the command line

Just run this command in the same directory were the file is placed! If it doesn't work you must add R to the PATH variable!

    Rscript word.game.R


    
#How to add R to your path variable in Windows (the installer doesn't do that in Windows, but its does in Mac and Linux)
##You must add the the bin folder were the R.exe is placed (usually C:\Program Files\R\R.version.number\bin) in order to run the program from the command line

![Setting the PATH variable in Windows](https://embox.googlecode.com/svn/wiki/images/InstallToolchainPath/environment-variables-path-cygwin.png?_sm_au_=iVV5pRLFrTT6sP4n)