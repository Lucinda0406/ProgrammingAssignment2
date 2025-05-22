## Put comments here that give an overall description of what your
## functions do
        # The functions first create a special matrix object that can cache the inverse
        # Then the cacheSolve function compute or retrieve the cached inverse matrix
## Write a short comment describing this function
        # This function creates a special matrix object that can cache the inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y 
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(i) m <<- i
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse
}


## Write a short comment describing this function
        # Compute or retrieve the cached inverse
cacheSolve <- function(x, ...) {
        m <- x$getInverse()

        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$getInverse(m)
        ## Return a matrix that is the inverse of 'x'
}
