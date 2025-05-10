# Introduction to R - Session 4
# Author: Mostafa S. Abd El-Maksoud

# ------------------------
# Read Data
# ------------------------

# Read the data from a text file with headers
data <- read.table("data.txt", header = TRUE)

# ------------------------
# Data inspection
# ------------------------

# Open a data viewer window to inspect the dataset
View(data)

# Display the structure of the dataset
str(data)

# ------------------------
# Data Preprocessing: Cleaning and Formatting the Surgery Dataset
# ------------------------

data$sex      <- factor(data$sex, labels = c("female", "male"))
data$SES      <- factor(data$SES, labels = c("low", "middle", "high"))
data$complic  <- factor(data$complic, labels = c("no", "yes"))
data$comorb   <- factor(data$comorb, labels = c("no", "yes"))
data$depressi <- factor(data$depressi, labels = c("no", "yes"))
data$diabetes <- factor(data$diabetes, labels = c("no", "yes"))
data$surgery  <- factor(data$surgery, labels = c("gastric band", "gastric bypass"))

data$BMIpost <- as.numeric(gsub(",", ".", data$BMIpost))
data$BMIpre  <- as.numeric(gsub(",", ".", data$BMIpre))
data$weight  <- as.numeric(gsub(",", ".", data$weight))
data$length  <- as.numeric(gsub(",", ".", data$length))

# Check updated structure
str(data)

# ------------------------
# Descriptive Statistics
# ------------------------

summary(data)
mean(data$weight, na.rm = TRUE)
median(data$weight, na.rm = TRUE)
min(data$weight, na.rm = TRUE)
max(data$weight, na.rm = TRUE)
quantile(data$weight, na.rm = TRUE, c(0.25, 0.75))

# Why use na.rm = TRUE?
median(c(10, 20, NA), na.rm = TRUE)
median(c(10, 20, NA), na.rm = FALSE)

# ------------------------
# Frequency table for categorical variable
# ------------------------

table(data$sex)

# Mean age by sex
tapply(data$age, list(sex = data$sex), mean, na.rm = TRUE)

# Correlation coefficient
library(corrplot)
cor(data$weight, data$length, use = "complete.obs")

# Help: which correlation method?
?cor  # Default: "pearson"

# Spearman correlation
cor(data$weight, data$length, use = "complete.obs", method = "spearman")

# More summaries
max(data$weight, na.rm = TRUE)
sum(is.na(data$age))
aggregate(BMIpre ~ surgery, data, mean, na.rm = TRUE)
cor(data$BMIpre, data$BMIpost, use = "complete.obs", method = "pearson")

# ------------------------
# Graphics
# ------------------------

barplot(table(data$sex), xlab = "Gender", ylab = "Frequency", main = "Gender Barplot")

mean.age <- tapply(data$age, data$sex, mean, na.rm = TRUE)
barplot(mean.age, col = "skyblue", xlab = "Gender", ylab = "Mean Age", main = "Mean Age by Sex")

hist(data$age, xlab = "Age", ylab = "Frequency", main = "Age Histogram")

plot(weight ~ length, data = data, col = data$SES, pch = 19,
     main = "Weight vs Length by SES", xlab = "Length", ylab = "Weight")
legend("topright", legend = levels(data$SES), col = 1:length(levels(data$SES)), pch = 19)

plot(weight ~ length, data = data, col = data$SES, pch = 19,
     main = "Weight vs Length by SES", xlab = "Length", ylab = "Weight")

unique_ses <- unique(data$SES)
ses_colors <- rainbow(length(unique_ses))

for(i in 1:length(unique_ses)) {
  ses_group <- unique_ses[i]
  subset_data <- data[data$SES == ses_group, ]
  abline(lm(weight ~ length, data = subset_data), col = ses_colors[i], lwd = 2)
}
legend("topright", legend = levels(data$SES), col = ses_colors, pch = 19, lwd = 2)

par(mfrow = c(2,2))
boxplot(data$age, main = "Box plot of age", ylab = "Age")
boxplot(data$age ~ data$SES, xlab = "SES group", ylab = "Age", main = "Boxplot of Age by SES Group")
boxplot(data$age ~ data$surgery, xlab = "Surgery group", ylab = "Age", main = "Boxplot of Age by Surgery Group")
boxplot(data$age ~ data$sex, xlab = "Gender", ylab = "Age", main = "Boxplot of Age by Gender")

hist(data$BMIpre, xlab = "BMIpre", ylab = "Frequency", main = "Histogram of BMIpre")

barplot(table(data$SES), xlab = "SES", ylab = "Frequency", main = "Barplot of socio-economic status", col = "skyblue")

boxplot(data$BMIpre ~ data$surgery,
        xlab = "Surgical Intervention Type",
        ylab = "BMI Before Surgery",
        main = "Boxplot of BMI Before Surgery by Intervention Type",
        col = c("skyblue", "lightpink"))

boxplot(data$BMIpost ~ data$surgery,
        xlab = "Surgical Intervention Type",
        ylab = "BMI Post Surgery",
        main = "Boxplot of BMI Post Surgery by Intervention Type",
        col = c("blue", "pink"))

plot(x = data$age, y = data$BMIpre, xlab = "Age",
     ylab = "BMI Before Surgery", main = "Scatterplot of BMIpre vs Age",
     pch = 19, col = "darkgreen")

pch.values <- c(1, 2)
names(pch.values) <- levels(data$sex)

plot(data$BMIpre ~ data$age,
     col = as.numeric(data$sex),
     pch = pch.values[data$sex],
     xlab = "Age", ylab = "BMI Before Surgery", main = "BMIpre vs Age by Sex")
legend("topright", legend = levels(data$sex), col = 1:length(levels(data$sex)), pch = 1:length(levels(data$sex)))

plot(data$BMIpre ~ data$age, col = as.numeric(data$sex), xlab = "Age",
     ylab = "BMI Before Surgery", main = "BMIpre vs Age by Sex", pch = as.numeric(data$sex))

for (gender in levels(data$sex)) {
  sub_data <- subset(data, sex == gender)
  model <- lm(BMIpre ~ age, data = sub_data)
  abline(model, col = which(levels(data$sex) == gender), lwd = 2)
}
pch.values <- c(1, 2)
names(pch.values) <- levels(data$sex)

legend("topright", legend = levels(data$sex), pch = pch.values,
       col = 1:length(levels(data$sex)), title = "Sex", pt.cex = 1.2)

# ------------------------
# Outlier Detection
# ------------------------

outlires_threshold <- 40
data$BMIpre[data$BMIpre > outlires_threshold] <- 29.41
data$BMIpost[data$BMIpost > outlires_threshold] <- 29.41

write.table(data, "E:/courses/Introduction to R/Session 4/modified_surgery.txt", 
            sep = "\t", row.names = FALSE, col.names = TRUE)

# ------------------------
# Testing for Normality
# ------------------------

par(mfrow = c(1,2))
hist(data$BMIpre, main = "Histogram of BMIpre", xlab = "BMIpre", col = "lightblue")
hist(data$BMIpost, main = "Histogram of BMIpost", xlab = "BMIpost", col = "lightgreen")

par(mfrow = c(1,2))
qqnorm(data$BMIpre, main = "QQ Plot of BMIpre")
qqline(data$BMIpre, col = "red")
qqnorm(data$BMIpost, main = "QQ Plot of BMIpost")
qqline(data$BMIpost, col = "blue")

shapiro_pre <- shapiro.test(data$BMIpre)
shapiro_post <- shapiro.test(data$BMIpost)
print(shapiro_pre)
print(shapiro_post)

