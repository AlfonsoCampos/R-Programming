rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("C:\\R\\rprog-data-ProgAssignment3-data\\outcome-of-care-measures.csv",
                     colClasses = "character")    
    
    ## Check that state and outcome are valid
    if (!(state %in% state.abb))
        stop("invalid state")
    
    if (!(outcome %in% c("heart attack","heart failure","pneumonia")))
        stop("invalid outcome")    
    
    ## For each state, find the hospital of the given rank    
    states <- sort(state.abb)
    
    ranks <- data.frame(hospital=NA, state=NA)
    
    for (i in 1:length(states)) {
        ranks[i, ] <- c(rankhospital(states[i], outcome, num), states[i])
    }
    
    ranks
    
    ## Return a data frame with the hospital names and the (abbreviated) state name
    
    
}
