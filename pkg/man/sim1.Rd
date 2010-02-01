\name{sim1}
\alias{sim1}

\title{ Simulation Model }
\description{
Three sets of variables are calculated: explanatory, intermediate and
response variables.
}
\usage{
sim1(N, tau=0.8, prob=0.5)
}
\arguments{
  \item{N}{number of simulated observations.}
  \item{tau}{describes the connection between explanatory and intermediate
variable.}
  \item{prob}{starting value, a probability for a Bernoulli experiment.}
}
\details{
Explanatory, intermediate and response variables are bivariate variables.
Let one explanatory variable be denoted by x and one intermediate variable
be denoted by w respectively.
10 explanatory and 10 intermediate variables are simulated, which define one
response variable z. The probability \code{tau} describes the connection between
one explanatory and one intermediate variable:
\code{tau := P(w=0|x=1) = P(w=1|x=0)}.
}
\value{
  A list of three sets of variables
  \item{X}{N*10 matrix of 10 explanatory variables.}
  \item{Y}{N*10 matrix of 10 intermediate variables.}
  \item{zr}{response vector.}
}
\references{
David J. Hand, Hua Gui Li, Niall M. Adams (2001),
Supervised classification with structured class definitions,
\emph{Computational Statistics and Data Analysis}, \bold{36},
209-225
}
\author{Andrea Peters <Peters.Andrea@imbe.imed.uni-erlangen.de>}
\note{
The simulation model is appropriate for the indirect classification approach and described in Hand et al. (2001)
}
\keyword{misc}

