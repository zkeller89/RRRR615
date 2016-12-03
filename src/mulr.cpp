#include<RcppEigen.h>

using Eigen::Map;               	// 'maps' rather than copies 
using Eigen::MatrixXd;                  // variable size matrix, double precision
using Eigen::VectorXd;                  // variable size vector, double precision

using namespace Rcpp;

// [[Rcpp::export]]
List mulr(Eigen::Map<Eigen::MatrixXd> X, Eigen::Map<Eigen::MatrixXd> y ) {
	Eigen::JacobiSVD<Eigen::MatrixXd> svd(X,Eigen::ComputeThinU | Eigen::ComputeThinV); // compute SVD

  Eigen::JacobiSVD<Eigen::MatrixXd> proj( X*svd.solve(y), Eigen::ComputeFullV );

  return List::create( 
    Rcpp::Named("Svalues") = proj.singularValues(),
    Rcpp::Named("Svec") = proj.matrixV()   );
}

