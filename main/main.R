# Load the required libraries
library(nortest)
library(outliers)
library(MASS)

# Set working directory
path <- getwd()
setwd(path)

# Load data with the file from data folder
asteroids <- read.table("./data/asteroids.txt", header = TRUE)

# Load globular clusters data from two files
galaxies_M31 <- read.table('./data/GlobClus_M31.dat', header = TRUE)
galaxies_MW <- read.table('./data/GlobClus_MWG.dat', header = TRUE)

# Sort data using second column
asteroids_sorted <- asteroids[order(asteroids$Dens),]

# Assign columns
names <- asteroids_sorted[, 1]
densinity <- asteroids_sorted[, 2]
error <- asteroids_sorted[, 3]

# Assign variables
m_31 <- galaxies_M31[,2] 
milky_way <- galaxies_MW[,2]
print(m_31)
print(milky_way)

# Analyzing data about the asteroid. The following code consists of the analysis of astronomical data to comment on the analysis of data about globular clusters
summary(asteroids)

# Calculate standard deviation
standard_deviation_densinity <- sd(densinity)
standard_deviation_err <- sd(error)
print(standard_deviation_densinity)
print(standard_deviation_err)

# Defining the function to calculate median standard error 
se_function <- function(s, n) { 
  se = s * 1.253 / sqrt(n)
  return(se)
}

# Calculate median standard error
se_densinity <- se_function(standard_deviation_densinity, length(names))
se_error <- se_function(standard_deviation_err, length(names))
print(se_densinity)
print(se_error)

# Plotting the first graph of astronominal data
graph_data <-
  dotchart(
    densinity,
    labels = names,
    cex = 0.9,
    xlab = expression(Densinity ~ (g / cm ^ 3))
  )

# Plotting the second graph of astronominal data
graph_errors <-
  plot(
    densinity,
    ylim = c(0, 8),
    xlab = "Asteroids",
    ylab = expression(Densinity ~ (g / cm ^ 3)),
    pch = 20
  ) + grid()

number <- seq(1, length(densinity))
graph_with_all <- segments(number, densinity + error, number, densinity - error)

# Plotting the third graph of astronominal data
graph_comprasion <-
  boxplot(
    asteroids[, 2:3],
    varwidth = T,
    notch = T,
    xlab = "Asteroids",
    ylab = "Densinity
",
    pars = list(
      boxwex = 0.3,
      boxlwd = 1.5,
      whisklwd = 1.5,
      staplelwd = 1.5,
      outlwd = 1.5,
      font = 2
    )
  )


# Kolmogorov-Smirnov test
lillie.test(densinity)
lillie.test(error)

# Shapiro-Wilk test
shapiro.test(densinity)
shapiro.test(error)

# Dixon test
dixon.test(densinity)

# The Grubbs statistic
grubbs.test(densinity)

# Analyzing  data about globular clusters
summary(galaxies_MW)
summary(galaxies_M31)

# Plotting histogram 
histogram_milky_way <- hist(milky_way)
histogram_m_31 <- hist(m_31)

# Calculate dostance module 
module <- median(milky_way) - median(m_31)
print(module)

# Plotting the first graph of globular clusters data
graph_distribution_mw <-
  plot(
    ecdf(milky_way),
    cex.points = 0,
    verticals = T,
    main = "Empirical Distributors",
    col = "green"
  )

graph_distribution_m31 <-
  plot(
    ecdf(m_31 + module),
    cex.points = 0,
    verticals = T,
    add = T,
    main = "Empirical Distributors",
    col = "red"
  )

legend <-
  legend(
    -8,
    0.2,
    legend = c("Milky way", "M31"),
    col = c("green", "red"),
    lty = 1,
    cex = 0.8
  )

grid <- grid()

# The rank test Wilcoxon
wilcox.test(milky_way, m_31 + module)

# Plotting the second graph of globular clusters data
graph_quantil_mw_1 <-
  qqnorm(
    milky_way,
    pch = 20,
    cex.axis = 1.3,
    cex.lab = 1.3,
    main = ""
  )

graph_quantil_mw_2 <- qqline(milky_way, lty = 2, lwd = 1.5)

# Plotting the third graph of globular clusters data
graph_quantil_m31_1 <-
  qqnorm(
    m_31,
    pch = 20,
    cex.axis = 1.3,
    cex.lab = 1.3,
    main = ""
  )

graph_quantil_m31_2 <- qqline(m_31, lty = 2, lwd = 1.5)

# Plotting the fourth graph of globular clusters data
graph_quantil_all <-
  qqplot(
    m_31,
    milky_way,
    pch = 20,
    cex.axis = 1.3,
    cex.lab = 1.3,
    main = "",
    xlab = "M31",
    ylab = "Milky way"
  )


# Kolmogorov-Smirnov Tests
ks.test(milky_way, m_31 + module)

# Analyzing data of survey from Mass module 
height <- survey$Height 
estimator <- mean(height, na.rm = T)
print(estimator)

# Student distribution
standard_deviation_student <- sd(height, na.rm = T)
n <- length(height)
student_t <- qt(0.975, n - 1)
print(student_t)

# Defining the function of confidence interval 
quantil_function <- function(problaity, number, standard_deviation_value, estimator_value) {
  if (problaity > 0.05){
    fraction <- 1 - (1 - problaity) / 2
  } else {
    fraction <- problaity / 2
  }
  quantil <- qt(fraction, number - 1) * standard_deviation_value / sqrt(number) + estimator_value
  return(quantil)
}

# Calculate quantil
quantil_1 <- quantil_function(0.05, n, standard_deviation_student, estimator)
quantil_2 <- quantil_function(0.95, n, standard_deviation_student, estimator)
print(quantil_1) 
print(quantil_2)

# Calculate quantil errors
quantil_mean <- mean(quantil_1, quantil_2)
quantil_error <- sd(quantil_1, quantil_2)
print(quantil_mean)
print(quantil_error)

# Analyzing smokers data 
exer <- survey$Exer
smoke <- survey$Smoke
table_Smoke <- table(survey$Exer, survey$Smoke)
print(table_Smoke)

#	Pearson's Chi-squared test
chisq.test(exer, smoke)

# Regresion 
x <- faithful$eruptions
y <- faithful$waiting
regline <- lm(x ~ y)
summary(regline)

# Plotting regresion 
plot(x ~ y, ylab = "The length of the eruption [min]", xlab = "Waiting time for the next eruption [min]")
line <- abline(regline, lwd = 2, col = 2)

# Print residuals
plot(regline$residuals)

# Print AIC and BIC
print(AIC(regline))
print(BIC(regline))

# Fitting regresion line 
regline_1 <- lm(eruptions ~ waiting, data = faithful)
time_80 = predict(regline_1, data.frame(waiting = c(80)), interval = "confidence")
print(time_80)



