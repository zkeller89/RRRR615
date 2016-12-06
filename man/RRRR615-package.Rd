\name{RRRR615-package}
\alias{RRRR615-package}
\alias{RRRR615}
\docType{package}
\title{
\packageTitle{RRRR615}
}
\description{
\packageDescription{RRRR615}
}
\details{
Please type "?RRLM" for documentation on the Reduced Rank Linear Model function.
}
\author{
\packageAuthor{RRRR615}

Maintainer: \packageMaintainer{RRRR615}
}
\references{\href{http://dept.stat.lsa.umich.edu/~jizhu/pubs/Mukherjee-SADM11.pdf}{Mukherjee and Zhu(2011)}
}
\keyword{ package }
\examples{
data(method1)
my_RRLM <- RRLM(X = method1$DM,
                Y = method1$Y,
                lambda = 0.05,
                r = 15,
                INT = TRUE,
                Yfit = TRUE)

names(my_RRLM)
}
