## Functions defining a matrix capable of caching its inverse.
## Sample usage: 
## mat <- makeCacheMatrix(m)
## cacheSolve(mat)
## mat$getInverse()
## etc...

## Function that creates the matrix, defines its getters and setters and sets the cached inverse to null
makeCacheMatrix <- function(x = matrix()) {
  #set the inverse as null when the matrix is created
  inv <- NULL
  
  #setter that assigns the matrix to some new matrix and sets the inverse to null
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  #returns the matrix
  get <- function() x
  
  #function to set the inverse matrix as something
  setInverse <- function(inverse) inv <<- inverse
  
  #function to return the inverse matrix
  getInverse <- function() inv
  
  #list the functions for further access
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


# Function that returns the inverse of a matrix created via makeCacheMatrix.
# Uses a cached value from a previous calculation, if possible, otherwise it caches
# the result.
cacheSolve <- function(x) {
  # Gets the current inverse matrix
  inv <- x$getInverse()
  
  # If the current inverse matrix isn't null, then it has already been calculated
  # and this value should just be returned.
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, get the actual matrix via x$get() and solve it.
  data <- x$get()
  inv <- solve(data)
  
  # Cache the calculated value, via setInverse and return this value.
  x$setInverse(inv)
  inv
}
