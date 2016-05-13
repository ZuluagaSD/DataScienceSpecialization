
library("kernlab")
data("spam")

set.seed(3435)
trainIndicator <- rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam <- spam[trainIndicator == 1, ]
testSpam <- spam[trainIndicator == 0, ]

names(trainSpam)

table(trainSpam$type)

plot(trainSpam$capitalAve ~ trainSpam$type)

plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)

plot(log10(trainSpam[, 1:4] + 1))

hCluster <- hclust(dist(t(log10(trainSpam[, 1:55] + 1))))
plot(hCluster)

trainSpam$numType <- as.numeric(trainSpam$type) - 1

costFunction <- function(x, y) sum(x != (y > 0.5))

cvError <- rep(NA, 55)

library(boot)

for (i in 1:55) {
    lmFormula <- reformulate(names(trainSpam)[i], response = "numType")
    glmFit <- glm(lmFormula, family = "binomial", data = trainSpam)
    cvError[i] <- cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}

## Which predictor has minimum cross-validate error?
names(trainSpam)[which.min(cvError)]
