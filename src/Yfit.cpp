#include<RcppEigen.h>

using namespace Rcpp;

// [[Rcpp::export]]
List Yfit(Eigen::Map<Eigen::MatrixXd> X, Eigen::Map<Eigen::MatrixXd> beta, Eigen::Map<Eigen::MatrixXd> Y,int n) {
	
	Eigen::MatrixXd Yhat = X*beta;
	Rcpp::NumericMatrix Yfit(wrap(Yhat));
	Eigen::MatrixXd Ydiff = Y - Yhat;
	double error = Ydiff.squaredNorm()/n;

	return List::create( 
 	Rcpp::Named("Yfit") = Yfit,
    Rcpp::Named("Error") =   error ) ;

}