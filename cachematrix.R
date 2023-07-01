# Function to create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x) {
  # Initialize the inverse to NULL
  inverse <- NULL
  
  # Setter function to set the matrix and invalidate the cache
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  # Getter function to retrieve the matrix
  get <- function() {
    x
  }
  # Function to compute the inverse of the matrix
  cacheSolve <- function() {
    # Check if the inverse is already computed and cached
    if (!is.null(inverse)) {
      message("Retrieving cached inverse.")
      return(inverse)
    }
    
    # Compute the inverse using the solve function
    inverse <- solve(x)
    
    # Cache the inverse
    message("Caching inverse.")
    cacheSolve$inverse <- inverse
    # Return the inverse
    inverse
  }
  
  # Create and return a list of functions
  list(set = set, get = get, cacheSolve = cacheSolve)
}

