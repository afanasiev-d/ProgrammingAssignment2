makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # This will store the cached inverse matrix
  
  set <- function(y) {
    x <<- y  # Assign new matrix to 'x' in the parent environment
    inv <<- NULL  # Reset cached inverse when matrix is updated
  }
  
  get <- function() x  # Return the stored matrix
  
  setinverse <- function(inverse) inv <<- inverse  # Store inverse in cache
  
  getinverse <- function() inv  # Retrieve cached inverse
  
  # Return a list of functions to interact with the matrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
