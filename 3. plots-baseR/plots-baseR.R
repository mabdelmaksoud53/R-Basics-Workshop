# Data visualization Part-1 (Base R Plotting)
# Author: Mostafa S. Abd El-Maksoud

# 1. bar plot

# A bar plot is a graphical display of data using bars of different heights.
# In R, the barplot() function is commonly used to visualize categorical data 
# with corresponding numerical values.

# Load the dataset and extract data for plotting
VADeaths                           # View the dataset
x <- VADeaths[1:3, "Rural Male"]   # Extract first 3 age groups for Rural Males
x                                  # View extracted values

# Basic Bar plots

# Vertical bar plot (default)
barplot(x)

# Horizontal bar plot
barplot(x, horiz = TRUE)

# Change group names
barplot(x, names.arg = c("A", "B", "C"))

# Change color
barplot(x, names.arg = c("A", "B", "C"), col = "white", border = "steelblue")
barplot(x, col = "white", border = c("grey", "yellow", "blue"))
barplot(x, col = "black")
barplot(x, col = c("grey", "yellow", "blue"))
barplot(x, names.arg = c("Group_A", "Group_B", "Group_C"),
        col = c("grey", "blue", "yellow"), border = "black")

# Change main title and axis labels
barplot(x, main = "Death Rates in Virginia",
        xlab = "Age", ylab = "Rate")

# Stacked bar plots
barplot(VADeaths,
        col = c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk"),
        legend = rownames(VADeaths))

# Grouped bar plots
barplot(VADeaths,
        col = c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk"),
        legend = rownames(VADeaths),
        beside = TRUE)

# Full Custom Grouped Bar Plot with Legend
my_colors <- c("lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk")
barplot(VADeaths, col = my_colors, border = "black",
        beside = TRUE, horiz = FALSE,
        main = "Bar Plot", xlab = "X-axis", ylab = "Y-axis")
legend("topleft", legend = rownames(VADeaths),
       fill = my_colors, box.lty = 1, cex = 0.8)

# 2. box plot

# Box plots visualize the distribution of numerical data across different groups.

# Load the built-in dataset
data <- ToothGrowth
head(data, 6)
str(data)

# Box plot of a single variable
boxplot(ToothGrowth$len)

# Box plots grouped by dose
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE)
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE, horizontal = TRUE)
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE, notch = TRUE)

# Change group names
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        names = c("D0.5", "D1", "D2"))

# Change color
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE, border = "steelblue")
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        border = c("#999999", "#E69F00", "#56B4E9"))
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE, col = "steelblue")
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        col = c("#999999", "#E69F00", "#56B4E9"))

# Box plot with multiple groups
boxplot(len ~ supp*dose, data = ToothGrowth,
        col = c("white", "steelblue"), frame = FALSE)

# Add main title and axis labels
boxplot(len ~ dose, data = ToothGrowth,
        main = "Plot of Length by Dose",
        xlab = "Dose (mg)", ylab = "Tooth Length",
        col = "lightgray", frame = FALSE)

# Box plot with the number of observations: gplots::boxplot2()
library("gplots")
boxplot2(len ~ dose, data = ToothGrowth, frame = FALSE)
boxplot2(len ~ dose, data = ToothGrowth, frame = FALSE, top = TRUE)

# Plot multiple plots in one graph
par(mfrow = c(2, 2))
plot(1:10, type = "S", main = "Plot 1")
hist(rnorm(100), main = "Plot 2")
boxplot(mpg ~ cyl, data = mtcars, main = "Plot 3")
barplot(table(iris$Species), main = "Plot 4")

# 3. Line Plots - R Base Graphs

# Create some numeric data
x <- 1:10
y1 <- x * x
y2 <- 2 * y1

# Stair-step plot
plot(x, y1, type = "S", main = "Stair Step Plot", xlab = "x", ylab = "y1")

# Points and lines
plot(x, y1, type = "b", pch = 19, col = "red", xlab = "x", ylab = "y1")

# Plot Multiple Lines on the Same Graph
plot(x, y1, type = "b", frame = TRUE, pch = 19,
     col = "red", xlab = "x", ylab = "y-values",
     main = "Multiple Line Plot")
lines(x, y2, type = "b", pch = 18, col = "blue")

# 4. Histogram Plots in R

# Set seed for reproducibility
set.seed(1234)
x <- c(rnorm(200, mean = 55, sd = 5),
       rnorm(200, mean = 65, sd = 5))
head(x)

# Basic Histogram
hist(x, col = "steelblue", 
     main = "Histogram of Weights",
     xlab = "Weight", ylab = "Frequency")

# Adjust the Number of Bins
hist(x, col = "steelblue", 
     breaks = 30,
     main = "Histogram with 30 Bins",
     xlab = "Weight", ylab = "Frequency")

# Histogram using Sturges method
hist(x, breaks = "Sturges", col = "skyblue",
     main = "Histogram (Sturges Method)",
     xlab = "Weight")

# 5. density plots: density()

# Compute the kernel density estimate
dens <- density(mtcars$mpg)

# Basic density plot
plot(dens, frame = FALSE, col = "steelblue",
     main = "Density Plot of mpg",
     xlab = "Miles Per Gallon (mpg)")

# Fill the density area
plot(dens, frame = FALSE, col = "steelblue",
     main = "Filled Density Plot of mpg",
     xlab = "Miles Per Gallon (mpg)")
polygon(dens, col = "steelblue", border = "black")
