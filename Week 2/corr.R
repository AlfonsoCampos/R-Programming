corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    data<-complete(directory)
    dataok<-data[(data$nobs>threshold),]
    idok<-dataok[,1]
    
    cr <- vector()
    files <- list.files(directory, pattern="*.csv", full.names=TRUE)
    for (i in idok) {
        dataset <- read.csv(files[i])
        cleanset <- na.omit(dataset)        
        cr <- c(cr, round(cor(cleanset[,2], cleanset[,3]), digits = 4))
    }
    
    ## Return a numeric vector of correlations
    cr
    
}