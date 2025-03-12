# 1. Y = 2000 + 300*x1 + 350*x2. x1 = x2 = 0 --> 2000
# 2. Extracuricular activities
# 3. Y = 2000 + 300 * 10 + 350 * x2 = 5000 + 350 * x2
#    Minimal 5000


# LAB
install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
data(abalone)
install.packages('ggplot2')
library(ggplot2)
# 1.
plot3 <- ggplot(aes(x = Rings, y = WholeWeight, color=000000), data =
  abalone) + geom_point()
plot3
weight.fit <- lm(WholeWeight ~ Rings, data = abalone)
plot(weight.fit$resid~abalone$Rings[order(abalone$Rings)])
summary(weight.fit)
coefficient <- coef(weight.fit)
plot3 + geom_abline(slope = coefficient[2],
                                        intercept = coefficient[1])
# There is no correlation

# 2.
complex.fit <- lm(Rings ~ Diameter + Height + WholeWeight, data = abalone)
# No coeffiecient close to the intercept, so no correlation

# 3.
variables <- c("Rings", "Diameter", "Height", "WholeWeight")
values <-abalone[variables]
cor(values)
# There is a likely correlation between Diameter, Height, and WholeWeight

# 4. No.

# 5.
plot(weight.fit, which = 1, col = 'blue')
plot(complex.fit, which = 1, col = 'red')