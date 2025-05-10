# Title: Data visualization Part- (ggplot2)
# Author: Mostafa S. Abd El-Maksoud

# Install necessary packages (uncomment if needed)
# install.packages("ggplot2")
# install.packages("ggsci")

# Load libraries
library(ggplot2)
library(ggsci)

# Load and inspect datasets
data(diamonds)
head(diamonds)

data(mpg)
head(mpg)

# 1. Bar Chart

# Basic bar plot
ggplot(diamonds, aes(x = cut)) +
  geom_bar() +
  theme_bw()

# Bar plot with fill
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar() +
  theme_bw()

# Bar plot with custom colors using ggsci
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar() +
  theme_bw() + 
  scale_fill_manual(values = pal_igv()(7))

# Bar plot with facets
ggplot(diamonds, aes(x = cut, fill = clarity)) +
  geom_bar() +
  theme_bw() +
  facet_wrap(~color)

# 2. Histogram

# Basic histogram
ggplot(diamonds, aes(x = price)) +
  geom_histogram(bins = 30, fill = "grey", color = "black", alpha = 0.5) +
  theme_bw() +
  labs(x = "Price", y = "Count", title = "Graph")

# Histogram with fill
ggplot(diamonds, aes(x = price, fill = cut)) +
  geom_histogram(bins = 30, alpha = 0.5) +
  theme_bw() +
  labs(x = "Price", y = "Count", title = "Graph")

# 3. Box Plot

# Basic box plot
ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot() +
  theme_bw()

# Box plot with grouping
ggplot(mpg, aes(x = drv, y = hwy, group = drv)) +
  geom_boxplot() +
  theme_bw()

# Box plot with fill by manufacturer
ggplot(mpg, aes(x = drv, y = hwy, fill = manufacturer)) +
  geom_boxplot() +
  theme_bw()

# Box plot with jitter
ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot() +
  geom_jitter(width = 0.2, aes(color = trans)) +
  theme_bw()

# 4. Scatter Plot

# Basic scatter plot
ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  theme_bw()

# Scatter with color by cut
ggplot(diamonds, aes(carat, price, color = cut)) +
  geom_point() +
  theme_bw()

# Scatter with color by clarity
ggplot(diamonds, aes(carat, price)) +
  geom_point(aes(color = clarity)) +
  theme_bw()

# Scatter with facets
ggplot(diamonds, aes(carat, price, color = cut)) +
  geom_point() +
  facet_grid(~cut) +
  theme_bw()

# Scatter with custom shape
ggplot(diamonds, aes(carat, price, color = cut)) +
  geom_point(shape = 21, size = 3, stroke = 2, fill = "white") +
  facet_grid(~cut) +
  theme_bw()

# Scatter with linear trend line
ggplot(diamonds, aes(carat, price, color = cut)) +
  geom_point(shape = 21, size = 3, stroke = 2, fill = "white") +
  stat_smooth(se = FALSE) +
  facet_grid(~cut) +
  theme_bw()