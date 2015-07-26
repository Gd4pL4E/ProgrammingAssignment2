#Little example script.

#Creates random matrix of 11x11 (check ?rnorm to see what kind of data is returned, or simply view the variable after you made it)
data <- matrix(rnorm(121), ncol = 11, nrow = 11)
#You can make the answer before hand to compare it with
answer <- solve(data)
#Make the variable which will be a list of functions, where the matrix is stored and later the invserse aswell
cm <- makeCacheMatrix(data)
#First time it will calculate it, no other message is given
cacheSolve(cm)
#The next time it will say "Showing cached data", and then return the inverse of the matrix that was cached in cm
cacheSolve(cm)