## This pair of functions allows me to find the inverse of an
## invertible matrix. It also caches that inverse so that if I
## need to find the inverse of that same matrix, I do not need
## to repeat the same calculation.

## This first function sets up a list of functions. The "get"
## function returns the matrix. The "setInverse" function
## sets the inverse of that matrix. The "getInverse" function
## returns that inverse. The "set" function resets the value of
## the matrix to be whatver is specified and reverts the "inverse"
## variable to NULL.

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setInverse <- function(matrix) inverse <<- matrix
        getInverse <- function() inverse
        list(set = set, get = get,
                setInverse = setInverse,
                getInverse = getInverse)
}

## This second function takes the object returned from the first
## function. First it checks to see if the inverse already is
## stored. If so, it returns that value. If not, it loads the
## value of the matrix, calculates the inverse, and sets that
## inverse to be "cached" with the matrix. If I run this function
## again on the same matrix, it will remember this cached value,
## and return it without calculation.

cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setInverse(inverse)
        inverse
}