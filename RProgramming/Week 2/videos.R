
if (x > 3) {
    y <- 10
} else {
    y <- 0
}

print(y)

y <- if (x > 3) {
    10
} else {
    0
}

for (i in 1:10) {
    print(i)
}

x <- c("a", "b", "c", "d")

for (i in 1:4) {
    print(x[i])
}

for (i in seq_along(x)) {
    print(x[i])
}

for (letter in x) {
    print(letter)
}

for(i in 1:4) print(x[i])

x <- matrix(1:6, 2, 3)

for (i in seq_len(nrow(x))) {
    for (j in seq_len(ncol(x))) {
        print(x[i, j])
    }
}

count <- 0
while (count < 10) {
    print(count)
    count <- count + 1
}

z <- 5
counter <- 0
while (z >= 3 && z <= 10) {
    print(z)
    coin <- rbinom(1, 1, 0.5)
    
    if (coin == 1) { ## Random Walk
        z <- z + 1
    } else {
        z <- z - 1
    }
    counter <- counter + 1
    print(z)
}

print(counter)

############################
## Your First R Function  ##
############################

add2 <- function(x, y) {
    x + y
}

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x, n) {
    use <- x > n
    x[use]
}

above <- function(x, n = 10) {
    use <- x > n
    x[use]
}

columnmean <- function(y, removeNA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(y[, i], na.rm = removeNA)
    }
    means
}

############################
## Functions Part 1       ##
############################

############################
## Functions Part 2       ##
############################

####################################
## Scoping Rules - Symbol Binding ##
####################################

lm <- function(x) {x * x}

f <- function(x, y) {
    x^2 + y / z
}

############################
## Dates and Times        ##
############################

x <- as.Date("2070-01-01")
