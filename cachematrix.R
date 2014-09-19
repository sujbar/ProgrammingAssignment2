# makeCacheMatrix is a function that returns a list of functions
makeCacheMatrix <- function(x = numeric()) {
        cache <- NULL #we r assinging a null initially to the cache
        setMatrix <- function(newValue) {
                x <<- newValue # a new value is assigned 
                cache <<- NULL
        } # this gives Matrix and store a matrix
        getMatrix <- function() {
                x 
        } #this function gets the Matrix
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        getInverse <- function() {
                cache
        }
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}
#The following function calculates the inverse of a "special" matrix created with 
-        ## Return a matrix that is the inverse of 'x'		+# makeCacheMatrix
cacheSolve <- function(y, ...) {
        inverse <- y$getInverse()
        if(!is.null(inverse)) {
                message("data cached")
                return(inverse)
        }
        
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        inverse
}
##Browse[4]> m=makeCacheMatrix(rbind(c(1,12,23),c(3,4,6),c(9,4,1)))
##Browse[4]> m
#Browse[4]> m$get()
#     [,1] [,2] [,3]
#[1,]    1   12   23
#[2,]    3    4    6
#[3,]    9    4    1
#Browse[4]> cacheSolve(m)
 #      [,1]  [,2]   [,3]
#[1,] -0.500  2.00 -0.500
#[2,]  1.275 -5.15  1.575
#[3,] -0.600  2.60 -0.800

