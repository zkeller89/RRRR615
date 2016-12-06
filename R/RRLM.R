#' Create a Reduced Rank Ridge Regression Model
#' 
#' @param X The design matrix for our model
#' @param Y The response matrix for our model
#' @param lambda The penalizing term for our model
#' @param r The rank to which we believe our Beta matrix to be; only r or CV should be specified
#' @param CV The proportion of the sum of the singular values needed for our reduced rank; only r or CV should be specified
#' @param INT A boolean indicating if an intercept term is desired in our model
#' @param Yfit A boolean indicating if fitted Y values and their errors should be returned
#' 
#' @export RRLM

RRLM = function(X,Y,lambda,r=NULL,CV=NULL,INT=TRUE,Yfit=FALSE){
  
  if(!is.null(r) && !is.null(CV)){
    return("Error: Only one of r and CV should be specified")
    break
  }
  
  n = nrow(X)
  
  if(INT==TRUE){
    X = cbind(rep(1,n),X)
  }
  p = ncol(X)
  q = ncol(Y)
  
  if(!is.null(r) && r > q){
    return("Error: r must be less than or equal to the number of columns of Y")
    break
  }
  
  if(nrow(Y) != n){
    return("Error: Dimensions do not match")
    break
  }
  v = colnames(X)
  if(!is.null(v))
  {
    v = c("intercept",v)
  }
  else
  {
    v = "intercept"
    for(i in 1:(p-1))
    {
      s = paste("V",i,sep = "")
      v = c(v,s)
    }
  }
  add <- sqrt(lambda)*diag(p)
  
  X.star <- rbind(X,add)
  Y.star <- rbind(Y,matrix(0,p,q))
  
  sv = mulr(X.star,Y.star)
  
  if(!is.null(r)){
    V = sv[[2]][,1:r]
  } else{
    if(is.null(CV)){
      CV = 0.9
    }
    ei = sv[[1]]^2
    r = min(which((cumsum(ei)/sum(ei))>=CV))
    V = sv[[2]][,1:r]
  }
  
  lambda.mat = lambda*diag(p)
  
  beta = Betafit(X,lambda.mat,Y,V,p)
  rownames(beta) = v
  if(Yfit==TRUE){
    fit = Yfit(X,beta,Y,n)
    output = list(beta,fit[1],fit[2])
    names(output) = c("beta","Yfit","Error")
    return(output)
  } else{
    output = list(beta)
    names(output) = c("beta")
    return(output)
  }
  
}