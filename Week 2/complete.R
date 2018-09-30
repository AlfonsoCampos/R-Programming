complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files <- list.files(directory, pattern="*.csv", full.names=TRUE)
    nobs <- vector()
        
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used    
    for (i in id) {
        dataset <- read.csv(files[i])
        nobs <- c(nobs, nrow(na.omit(dataset)))
    }
        
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    data <- data.frame(id = id, nobs = nobs)
    data
}