
mycomb <- function() {
  # stabilized LDA
  comb <- list(list(model=slda, predict=function(object, newdata)
                    predict.slda(object, newdata)$x),
  # 5-NN
               list(model=function(...) ipredknn(..., k=5),
                    predict=predict.ipredknn),
  # 10-NN
               list(model=function(...) ipredknn(..., k=10),
                    predict=predict.ipredknn), 
  # logistic regression model or
  # multinomial model
               list(model=function(...) multinom(...,trace=FALSE), 
                    predict=function(obj, newdata)
                    predict.multinom(obj, newdata, type="prob")))

  names(comb) <- c("sLDA", "5NN", "10NN", "multinom")
  comb
}
