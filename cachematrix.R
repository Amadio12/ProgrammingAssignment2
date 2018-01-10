## These functions are used to cache the inverse of a matrix, 

## so that it does not need to be recalculated every time it is called

## this function creates a series of functions to:

## get or set the value of the matrix or inverse matrix

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL

  set <- function (y=matrix()) {

    x <<- y

    inv <<- NULL

  }

  get <-function() x

  setinv <- function(invMatrix) inv <<- invMatrix

  getinv <- function(x) inv

  list(set = set, get = get,

       setinv = setinv,

       getinv = getinv)

}


## this function accepts a list of the form provided by makeCacheMatrix

## and either gets the stored matrix inverse, or calcualtes it if not done previously



cacheSolve <- function(x, ...) {

  ## Return a matrix that is the inverse of 'x'

  inv<- x$getinv(x)

  if(!is.null(inv)) {

    message("Getting cached data")

    return(inv)

  }

  data <- x$get()

  inv<- solve(data)

  x$setinv(inv)

  inv

  
}
