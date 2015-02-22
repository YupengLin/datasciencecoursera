## Put comments here that give an overall description of what your
## functions do
# The file contains two function, first function will return a special matrx

#the second function will calculated the inverse matrix and cache the result by using the matrix 
#generated in the first function
## Write a short comment describing this function
#This function will return a special matirx(actually a 4*1 list ),
#which contains four function
makeCacheMatrix <- function(x = matrix()) {
   inverse<- NULL
   set <- function(y){
   	  x <<- y
   	  inverse<<- NULL
   }
   get <- function(y) x
   setInverse <- function(inv) inverse <<- inv
   getInverse <- function() inverse
   list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
   

}


## Write a short comment describing this function
#This function will print out the message if the matrix is alreay calculate
#if the matrix has not been inversed the result will be stored
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if(!is.null(inv)){
        	message("getting cached data")
        	return(inv)
        }
        matrix <- x$get()
        inv<- solve(matrix)
        x$setInverse(inv)
        inv
}
