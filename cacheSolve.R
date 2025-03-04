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
