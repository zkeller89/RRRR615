# Set General parameters
N = 100
rho = 0.5
P = 50
Q = 20

# Create our design matrix, with correlated predictors
sig_x <- matrix(nrow = P, ncol = P)

for (i in 1:P){
  for (j in 1:P){
    sig_x[i,j] <- rho**abs(i - j)
  }
}

Xs <- MASS::mvrnorm(n = N, mu = rep(0, P), Sigma = sig_x)

# Create Initial beta matrix
betas <- matrix(rnorm(P * Q), nrow = P, ncol = Q)

betas_svd <- svd(betas)

betas_d <- betas_svd$d
betas_u <- betas_svd$u
betas_v <- betas_svd$v


# Method 1
  # First half of singular values 2, rest are 0
d1 <- diag(c(rep(2, floor(length(betas_d) / 2)), rep(0, ceiling(length(betas_d) / 2)))) 
betas1 <- betas_u %*% d1 %*% betas_v

# Method 2
  # all singular values are equal to 1
d2 <- diag(rep(1, length(betas_d)))
betas2 <- betas_u %*% d2 %*% betas_v

# Method 3
  # Larges singular values equal to 5, rest are 0
d3 <- diag(c(5, rep(0, length(betas_d) - 1)))
betas3 <- betas_u %*% d3 %*% betas_v

# Observations for methods 1, 2, and 3
var_y <- 0.25
Y1 <- Xs %*% betas1 + rnorm(n = N * Q, mean = 0, sd = sqrt(var_y))
Y2 <- Xs %*% betas2 + rnorm(n = N * Q, mean = 0, sd = sqrt(var_y))
Y3 <- Xs %*% betas3 + rnorm(n = N * Q, mean = 0, sd = sqrt(var_y))

method1 <- list(Y = Y1, DM = Xs, BETA = betas1)
method2 <- list(Y = Y2, DM = Xs, BETA = betas2)
method3 <- list(Y = Y3, DM = Xs, BETA = betas3)

########### Create function to run this stuff with different parameters

function(N, P, Q, rho, n){
  # N Samples
  # P predictors
  # Q is the number of observations per subject
  # rho is correlation parameter in exponential correlation structure
  
  # returns a list of 
  
  # create correltaion structure
  cor_Xs <- matrix(nrow = P, ncol = P)
  
  for (i in 1:P){
    for (j in 1:P){
      cor_Xs[i,j] <- rho**abs(i - j)
    }
  }
  
  # create design matrix
  Xs <- mvrnorm(n = N, mu = rep(0, P), Sigma = cor_Xs)
  
  # Create Initial beta matrix
  betas <- matrix(rnorm(P * Q), nrow = P, ncol = Q)
  
  betas_svd <- svd(betas)
  
  betas_d <- betas_svd$d
  betas_u <- betas_svd$u
  betas_v <- betas_svd$v
  
  # Method 1
  # First half of singular values 2, rest are 0
  d1 <- diag(c(rep(2, floor(length(betas_d) / 2)), rep(0, ceiling(length(betas_d) / 2)))) 
  betas1 <- betas_u %*% d1 %*% betas_v
  
  # Method 2
  # all singular values are equal to 1
  d2 <- diag(rep(1, length(betas_d)))
  betas2 <- betas_u %*% d2 %*% betas_v
  
  # Method 3
  # Larges singular values equal to 5, rest are 0
  d3 <- diag(c(5, rep(0, length(betas_d) - 1)))
  betas3 <- betas_u %*% d3 %*% betas_v
  
  # Observations for methods 1, 2, and 3
  #   adding noise, could change variance or make parameter
  var_y <- 0.25
  Y1 <- Xs %*% betas1 + rnorm(n = N * Q, mean = 0, sd = sqrt(var_y))
  Y2 <- Xs %*% betas2 + rnorm(n = N * Q, mean = 0, sd = sqrt(var_y))
  Y3 <- Xs %*% betas3 + rnorm(n = N * Q, mean = 0, sd = sqrt(var_y))
  
  ####
  ####
  ## Run our Regression with Y1 & our Xs
  ####
  ####
  
  ####
  ####
  ## Now get some measure of error
  ####
  ####
  
  
    
}