## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
        #When the script is run, m must be reset (since u put in new data)
        m <- NULL
        #Instead, you can set new data by using x$set 
        #Which also resets m (inverse needs to be calculated again for the new data).
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        #Return the currently in-use matrix (to be used by cacheSolve)
        get <- function() x
        #When setinverse is called, it will store the calculated inverse in m
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("showing cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
