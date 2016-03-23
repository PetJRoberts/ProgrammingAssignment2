## Two functions are used.
## 
## The solution is based on the makeVector and cachemean functions in the example given
## There are lots of comments as it helped me with understanding what is happening and for future reference
##
## makeCacheMatrix generates a list of 4 functions. These functions do as described below
## setmatrix - defines the matrix based on the input
## getmatrix - gets the matrix
## setinversemat - Sets the inverse matrix
## getinversemat - Gets the inverse matrix
##
## cacheSolve checks to see if the inverse of the matrix has been calculated and stored
## If it has been stored this value is returned
## If not the inverse of the matrix is calculated and returned



makeCacheMatrix <- function(x = matrix()) { ## coerrce x to class matrix
    
	inver <- NULL ## Set inver to NULL, needs to exist
    
	setmatrix <- function(y) {
        x <<- y # Sets x to y outside environment
        inver <<- NULL # Sets the variable inver to NULL outside environment
    }
	
    getmatrix <- function() {
		x ## returns x, the original matrix
	}
	
    setinversemat <- function(inverse) {
		inver <<- inverse ## Sets inver to inverse matrix outside this environment
    }
	
	getinversemat <- function() {
		inver ## returns inver
	}
	
    list(setmatrix=setmatrix, getmatrix=getmatrix, ## Set object to list
		setinversemat = setinversemat,
		getinversemat = getinversemat)
}

cacheSolve <- function(x, ...) { ## Take value x and any other variables required '...'
    
	inver <- x$getinversemat() ## Set inver to value from getinversmat function
    
	## If the inver value is NOT NULL i.e inverse has been calculated and stored in variable inver
	## The already stored inverse matrix will be returned
	if(!is.null(inver)) { 
	
        print("Getting cached data") ## Prints message
        inver ## Returns the inverse matrix
    
	## Otherwise find the inverse of the matrix with the solve function
	} else {
	    
		mattosolve <- x$getmatrix() ## Calls the matrix from x
		inver <- solve(mattosolve, ...) ## Calculates the inverse matrix using the solve function
		x$setinversemat(inver)  ## Calls the setinversemat function
		inver ## Returns the inverse matrix
	}
}