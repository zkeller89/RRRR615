#' Data from model 1 as proposed in Mukherjee and Zhu(2011)
#' 
#' A list containing elements of sample data as specified in Mukherjee and Zhu(2011) as "Model 1". With the first half of the singular values of our coefficient matrix as 2, and the second half as 0.
#'
#' @usage data(model1)
#'
#' @format A List with 3 elements, a Response Matrix (Y), a Design Matrix (DM), and a true beta matrix (BETA)
#' \describe{
#'   \item{Y}{100 X 20 Response Matrix}
#'   \item{DM}{100 X 50 Design Matrix}
#'   \item{BETA}{50 X 20 True Beta Matrix}
#' }
#' 
#' @references \url{http://dept.stat.lsa.umich.edu/~jizhu/pubs/Mukherjee-SADM11.pdf}
#' @source \url{https://github.com/zkeller89/RRRR615/blob/master/R/sample_data_edits.R}
"model1"

#' Data from model 2 as proposed in Mukherjee and Zhu(2011)
#' 
#' A list containing elements of sample data as specified in Mukherjee and Zhu(2011) as "Model 2", with all singular values of our coefficient matrix equal to 1.  
#'
#' @usage data(model2)
#'
#' @format A List with 3 elements, a Response Matrix (Y), a Design Matrix (DM), and a true beta matrix (BETA)
#' \describe{
#'   \item{Y}{100 X 20 Response Matrix}
#'   \item{DM}{100 X 50 Design Matrix}
#'   \item{BETA}{50 X 20 True Beta Matrix}
#' }
#' 
#' @references \url{http://dept.stat.lsa.umich.edu/~jizhu/pubs/Mukherjee-SADM11.pdf}
#' @source \url{https://github.com/zkeller89/RRRR615/blob/master/R/sample_data_edits.R}
"model2"

#' Data from model 3 as proposed in Mukherjee and Zhu(2011)
#' 
#' A list containing elements of sample data as specified in Mukherjee and Zhu(2011) as "Model 3", with the largest singular value of our coefficient matrix equal to 5, and the rest 0.
#'
#' @usage data(model3)
#'
#' @format A List with 3 elements, a Response Matrix (Y), a Design Matrix (DM), and a true beta matrix (BETA)
#' \describe{
#'   \item{Y}{100 X 20 Response Matrix}
#'   \item{DM}{100 X 50 Design Matrix}
#'   \item{BETA}{50 X 20 True Beta Matrix}
#' }
#' 
#' @references \url{http://dept.stat.lsa.umich.edu/~jizhu/pubs/Mukherjee-SADM11.pdf}
#' @source \url{https://github.com/zkeller89/RRRR615/blob/master/R/sample_data_edits.R}
"model3"