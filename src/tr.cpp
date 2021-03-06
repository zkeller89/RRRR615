#include<RcppEigen.h>

using namespace Rcpp;

// [[Rcpp::export]]

List tr(Eigen::Map<Eigen::MatrixXd> X, Eigen::Map<Eigen::MatrixXd> lam, Eigen::Map<Eigen::MatrixXd> y,Eigen::Map<Eigen::MatrixXd> V,int p) {
  Eigen::MatrixXd I(p,p);
  Eigen::MatrixXd beta;
	I << Eigen::MatrixXd::Identity(p,p);
	Eigen::MatrixXd A = X.transpose()*X + lam;
	Eigen::MatrixXd In = A.ldlt().solve(I);
	  Eigen::MatrixXd P = V*V.transpose();
    beta = In*((X.transpose()*y)*P);
    Rcpp::NumericMatrix Beta(wrap(beta));
	Rcpp::NumericMatrix Yfit(wrap(X*beta));
    return List::create( 
 	Rcpp::Named("Beta") = Beta,
    Rcpp::Named("Yhat") = Yfit   ) ;
}
