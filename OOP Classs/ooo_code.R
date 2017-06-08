
make_LD <- function(x){
  
  structure(data.frame(x),class="LongitudinalData")
  
}

print.LongitudinalData <- function(x){
  
  paste("Longitudinal dataset with",length(unique(x$id)),"subjects")
  
}

subject <- function(x,condition){
  UseMethod("subject")
}

subject.LongitudinalData <- function(x, condition){
  
  x[x$id == condition,]
  
}



