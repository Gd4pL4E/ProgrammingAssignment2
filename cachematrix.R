## In this file you find two functions, which are used to solve a matrix and then store the retrieved inverse.
## The first function creates a special "matrix" object that can cache its inverse.
## The second function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above, or if it finds cached data it will return that.

#

## makeCacheMatrix creates an object in which the matrix is stored, and in which the inverse can be cached, so we only need to calculate in inverse once. 

makeCacheMatrix <- function(x = matrix()) { 
        #When the script is run, m must be reset (since you put in new data)
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
        #When there is cached data, getinverse() is used to return this
        getinverse <- function() m
        #Since every function returns only the last command, we create a list of the 4 created functions (so all of them will be returned and named)
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve does the computing. It will look for cached data and if it is found, it will return it.
## If it does not find the cached data, it will find the inverse of the matrix using solve(), and then stores it.

cacheSolve <- function(x, ...) {
        #First we check if the data has been cached. If it is, it would be stored in x$getinverse()
        m <- x$getinverse()
        #If there is data there (meaning 'm' isc not null), we return that data and the script would then end)
        if(!is.null(m)) {
                message("Showing cached data")
                return(m)
        }
        #If there was no cached data we continue here. We first assign the matrix we have to a variable
        data <- x$get()
        #Then the inverse of the matrix is solved
        m <- solve(data, ...)
        #And then the data is cached, so when we call it next time, we don't need to use solve() again
        x$setinverse(m)
        #Of course, in the end, we return the calculated data
        m
}