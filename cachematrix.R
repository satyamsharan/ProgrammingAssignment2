## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it repeatedly
## 
## Matrix inverse caching is implemented using two functions 'makeCacheMatrix' and 'cacheSolve'
## 'makeCacheMatrix' creates the matrix capable of storing the cache while
## 'cacheSolve' returs the inverse cached or calculated depending on the cache availibility


## 'makeCacheMatrix' creates a cachable matrix from a R matrix, which it takes as an argument

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL             # the variable to store the cached inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL          # if setter is called then resetting the inverse
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## 'cacheSolve returns the inverse of the matrix created from makeCacheMatrix'

cacheSolve <- function(x) {
  inv <- x$getinverse()     # getting the cached inverse
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)             # returning the cached inverse if it is not null
  }
  data <- x$get()           # getting the matrix
  inv <- solve(X)           # getting inverse of matrix
  x$setinverse(inv)         # caching the inverse
  inv
}
