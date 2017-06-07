
# Factorial via loop --------------------------------------------------------------------------


factorial_loop <- function(x) {
  if (x == 1) {
    print(1)
  }
  else {
    for (i in x:2) {
      x = x * (i - 1)
      
    }
    x
  }
}


# Factorial via reduce ------------------------------------------------------------------------


factorial_reduce <- function(x){
  
  Reduce("*",1:x)
  
}


# Factorial via recursion ---------------------------------------------------------------------


factorial_func <- function(x) {
  if (x == 1) {
    1
  }
  else {
    x * factorial_func(x - 1)
    
  }
}


# Factorial via memoization (very basic implementation) -------------------------------------------------------------------

result <- 1

factorial_mem <- function(x){

 # result <<- length(x)
  
  if (x == 1) {
    1
  } else if (!is.na(result[x])) {return(result[x])}
  else {
    
    result[x]  <<-  x * factorial_func(x - 1)
    result[x]
  }
  
}


