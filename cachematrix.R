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


## Write a short comment describing this function

cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'
}
