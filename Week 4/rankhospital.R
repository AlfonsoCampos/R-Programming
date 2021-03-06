rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("C:\\R\\rprog-data-ProgAssignment3-data\\outcome-of-care-measures.csv",
                     colClasses = "character")
    
    ## Check that state and outcome are valid
    if (!(state %in% state.abb))
        stop("invalid state")
    
    if (!(outcome %in% c("heart attack","heart failure","pneumonia")))
        stop("invalid outcome")    
    
    ## Return hospital name in that state with the given rank 30-day death rate
    if (outcome=="heart attack"){
        dCols <- c(2,7,11)
    }   
    else if (outcome == "heart failure"){
        dCols <- c(2,7,17)
    }
    else{ #pneumonia
        dCols <- c(2,7,23)
    }
    
    uData <- data[, dCols]
    sData <- uData[uData$State == state, ]
    cData <- sData[sData[,3] != "Not Available", ]
    oData <- cData[order(as.numeric(cData[,3]),cData[,1]), ]
    
    if (num == "best"){
        out <- oData[1,1] #first
    }
    else if (num == "worst"){
        out <- oData[nrow(oData),1] #last
    }
    else{
        if (nrow(oData) >= num){
            out <- oData[num,1] #n-th
        }
        else{
            out <- NA
        }
    }
    
    out    
}