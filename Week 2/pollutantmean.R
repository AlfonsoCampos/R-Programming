pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files <- list.files(directory, pattern="*.csv", full.names=TRUE)
        
    datalist <- lapply(files, read.csv)
    dataset <- as.data.frame(do.call(rbind, datalist))

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    rightset <- dataset[dataset$ID %in% id,] # id is in range 
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    mean(rightset[,pollutant], na.rm=TRUE)
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
}