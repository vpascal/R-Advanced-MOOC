
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


# Factorial via memoization -------------------------------------------------------------------

result <- 1

factorial_mem <- function(x){

  
  if (x == 1) {
    1
  } else if (x < length(result) | x == length(result) ) {return(result[x])}
  else {
    
    result[x]  <<-  x * factorial_func(x - 1)
    result[x]
  }
  
}

factorial_mem(8)


# Testing -----------------------------------------------------------------

# Let's make sure all four functions return the same values

library(microbenchmark)
microbenchmark(
  factorial_loop(8),
  factorial_reduce(8),
  factorial_func(8),
  factorial_mem(8))
