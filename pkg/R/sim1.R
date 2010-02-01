sim1 <- function(N, tau=0.8, prob = 0.5){
  X <- c()
  Y <- c()
  zr <- c()

  for(j in 1:N){
   x <- rbinom(n = 10, size = 1, prob = prob)
   tauku <- ifelse(x == 0, tau, 1-tau)
   w <- rep(0, length(x))
   for(i in 1:length(tauku)){
    w[i] <- rbinom(n = 1, size = 1, prob = tauku[i])
   }
   z <- ifelse(floor(sum(w)/2)==(sum(w)/2), 0, 1)

   X <- rbind(X, x)
   Y <- rbind(Y, w)
   zr <- c(zr, z)
 }

   
 X <- data.frame(factor(X[,1], levels = c(0, 1)), 
        factor(X[,2], levels = c(0, 1)), 
        factor(X[,3], levels = c(0, 1)), 
        factor(X[,4], levels = c(0, 1)), 
        factor(X[,5], levels = c(0, 1)), 
        factor(X[,6], levels = c(0, 1)), 
        factor(X[,7], levels = c(0, 1)), 
        factor(X[,8], levels = c(0, 1)), 
        factor(X[,9], levels = c(0, 1)), 
        factor(X[,10], levels = c(0, 1)) 
        )
 Y <- data.frame(factor(Y[,1], levels = c(0, 1)), 
        factor(Y[,2], levels = c(0, 1)), 
        factor(Y[,3], levels = c(0, 1)), 
        factor(Y[,4], levels = c(0, 1)), 
        factor(Y[,5], levels = c(0, 1)), 
        factor(Y[,6], levels = c(0, 1)), 
        factor(Y[,7], levels = c(0, 1)), 
        factor(Y[,8], levels = c(0, 1)),
        factor(Y[,9], levels = c(0, 1)),
        factor(Y[,10], levels = c(0, 1))
        )
 zr <- factor(zr, levels = c(0, 1))

 

 colnames(X) <- paste("X", 1:10, sep="")
 colnames(Y) <- paste("Y", 1:10, sep="")

 result <- list(X, Y, zr)
 names(result) <- c("X", "Y", "z") 
 return(result)
}
