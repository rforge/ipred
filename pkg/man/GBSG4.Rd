\name{GBSG4}
\alias{GBSG4}
\non_function{}
\title{ German Breast Cancer Study Group 4  }
\usage{data(GBSG4)}
\description{
The \code{GBSG2} data 
}
\format{
  This data frame contains the observations of 662 women: 
  \describe{
    \item{age}{in years.}
    \item{menostat}{Menopausal status: a factor with levels \code{Pre} and \code{Post}. }
    \item{tsize}{tumor size (in mm).}
    \item{estrec}{estrogen receptor (in fmol).}
    \item{progrec}{progesterone receptor (in fmol).}
    \item{tgrade}{tumor grade (1,2,3).}
    \item{ttype}{tumor type, a factor with levels \code{Solid},
\code{Others} and \code{Invasive}. }
    \item{time}{recurrence free survival time (in ???).}
    \item{cens}{censoring indicator (0- censored, 1- event).}
  }
}
\details{
  THIS IS NOT PUBLIC !!!
  DO NOT CIRCULATE THIS DATA !!!
}
\source{
  Willi Sauerbrei
}
\examples{

cleans <- function(x) { attr(x, "time") <- NULL; names(x) <- NULL; x }


data(GBSG4)
table(GBSG4$menostat)
table(GBSG4$ttype)

# COX
d <- GBSG4

mod <- survfit(Surv(time, cens) ~ 1, data=d)
plot(mod, xlab="Zeit in Jahren", ylab="Wahrscheinlickeit")
a <- sbrier(Surv(d$time, d$cens), mod, btime=5)
a
b <- sbrier(Surv(d$time, d$cens), mod, btime = c(0,5))
b
stopifnot(all.equal(round(cleans(a), 3), 0.196))
stopifnot(all.equal(round(cleans(b), 3), 0.115))

COX <- as.numeric(d$age <= 40) + as.numeric(d$tsize > 20) + d$tgrade

COX[COX == 2] <- 1
COX[COX == 3] <- 2
COX[COX == 4 | COX == 5] <- 3

table(COX)

mod <- survfit(Surv(time, cens) ~ COX, data=d)
plot(mod, xlab="Zeit in Jahren", ylab="Wahrscheinlichkeit")

pred <- c()

for (i in 1:nrow(d))
  pred <- c(pred,getsurv(mod[COX[i]], 5))

cat("COX t=5: ")
    print(sbrier(Surv(d$time, d$cens), pred, btime=5))

\dontrun{
pred <- list()
for (i in 1:nrow(d))
  pred <- c(pred,list(mod[COX[i]]))

cat("COX integrated: ")
    print(sbrier(Surv(d$time, d$cens), pred, btime=c(0,5)))
# ==  0.1050987
}

}

}
\keyword{datasets}
