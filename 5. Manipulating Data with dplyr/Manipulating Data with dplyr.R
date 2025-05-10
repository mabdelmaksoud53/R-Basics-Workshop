# Manipulating Data with dplyr
# Author: Mostafa S. Abd El-Maksoud

# In this script, we will learn how to perform data manipulation — and create data processing pipelines — using a powerful package called `dplyr`.

# `dplyr` is part of the `tidyverse`, a collection of R packages for data science, including `ggplot2` for visualization.

# -------------------------------
# Preliminaries
# -------------------------------

# Install tidyverse if not already installed
install.packages("tidyverse")

# Load the tidyverse package
library("tidyverse")

# -------------------------------
# Goodbye Data Frames! Hello Tibbles
# -------------------------------

# `tidyverse` uses tibbles, a modern version of data frames
# Load dataset using `read_delim` (for tibbles)

data <- read_delim("data.tsv")

# Check structure of the dataset
str(data)

# View dataset in RStudio (opens a new tab)
View(data)

# -------------------------------
# Selecting Columns & Filtering Rows
# -------------------------------

# Select specific columns
data_subset <- select(data, Accession, Family, Order, Class)
data_subset

# Filter out unclassified entries
data_subset <- filter(data_subset, Family != "Unclassified" & Order != "Unclassified" & Class != "Unclassified")
data_subset

# -------------------------------
# Pipe: The "Then" Operator
# -------------------------------

# Same as above using pipes (`%>%`)
data_subset_using_pipe <- data %>% 
  select(Accession, Family, Order, Class) %>% 
  filter(Family != "Unclassified" & Order != "Unclassified" & Class != "Unclassified")

data_subset_using_pipe

# -------------------------------
# Adding Columns (Mutate)
# -------------------------------

# Add new column for genome length in kbp
data_with_new_column <- data %>%
  mutate(`Genome Length (kbp)` = `Genome Length (bp)` / 1000)

data_with_new_column

# -------------------------------
# Getting a Column (Pull)
# -------------------------------

# Get Accession column as a tibble
data %>% select(Accession)

# Get Accession column as a vector
data %>% pull(Accession)

# -------------------------------
# Split-Apply-Combine Data Analysis
# -------------------------------

# Count number of phages per host genus
data %>% 
  select(Accession, Host) %>% 
  filter(Host != "Unspecified") %>%
  group_by(Host) %>% 
  summarize(count = n()) %>%
  arrange(desc(count))

# Mean and median GC content by host genus
data %>% 
  select(Accession, Host, `molGC (%)`) %>% 
  filter(Host != "Unspecified") %>%
  group_by(Host) %>% 
  summarize(mean_gc = mean(`molGC (%)`),
            median_gc = median(`molGC (%)`)) %>%
  arrange(desc(mean_gc))
