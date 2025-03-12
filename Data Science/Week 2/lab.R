# Setting up libraries
install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)

# 1
data(abalone)

# 2
#b
pairs(abalone)

#3
#a
install.packages('ggplot2')
library(ggplot2)
#b
plot <- ggplot(aes(x = WholeWeight, y = ShuckedWeight), data =
  abalone) + geom_point()
plot

#4
#a
weight.fit <- lm(ShuckedWeight ~ WholeWeight, data = abalone)
plot(weight.fit$resid~abalone$WholeWeight[order(abalone$WholeWeight)])
#b
summary(weight.fit)

#5
coefficient <- coef(weight.fit)
plot + geom_abline(slope = coefficient[2],
                                        intercept = coefficient[1])

#6
plot2 <- ggplot(aes(x = Rings, y = ShuckedWeight, color=000000), data =
  abalone) + geom_point()
plot2
weight.fit <- lm(ShuckedWeight ~ Rings, data = abalone)
plot(weight.fit$resid~abalone$Rings[order(abalone$Rings)])
summary(weight.fit)
coefficient <- coef(weight.fit)
plot2 + geom_abline(slope = coefficient[2],
                                        intercept = coefficient[1])


# Own experimentation
plot3 <- ggplot(aes(x = Rings, y = Height, color=000000), data =
  abalone) + geom_point()
plot3
weight.fit <- lm(Height ~ Rings, data = abalone)
plot(weight.fit$resid~abalone$Rings[order(abalone$Rings)])
summary(weight.fit)
coefficient <- coef(weight.fit)
plot3 + geom_abline(slope = coefficient[2],
                                        intercept = coefficient[1])