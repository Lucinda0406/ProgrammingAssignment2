## Put comments here that give an overall description of what your
## functions do
## This pair of functions cache the inverse of a matrix

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL  # Initialize inverse as NULL
  
  set <- function(y) {
    x <<- y      # Set new matrix
    m <<- NULL # Reset inverse cache
  }
  
  get <- function() x            # Return the matrix
  setInverse <- function(i) m <<- i   # Cache the inverse
  getInverse <- function() m   # Retrieve the cached inverse
  
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
## This function returns the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been made. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it generates the inverse of the matrix  via the solve() function.
cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  mat <- x$get()           # Get the matrix
  m <- solve(mat, ...)   # Compute inverse
  x$setInverse(m)        # Cache the inverse
  m
        ## Return a matrix that is the inverse of 'x'
}
