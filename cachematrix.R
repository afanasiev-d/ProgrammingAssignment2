makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  
  
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


cacheSolve <- function(x, ...) {
  inv <- x$getinverse()  # Check if inverse is already cached
  
  if (!is.null(inv)) {  # If cached inverse exists, return it
    message("Getting cached inverse")
    return(inv)
  }
  
  data <- x$get()  # Retrieve the matrix
  inv <- solve(data, ...)  # Compute the inverse using solve()
  x$setinverse(inv)  # Cache the inverse 
  inv  # Return the inverse matrix
}
