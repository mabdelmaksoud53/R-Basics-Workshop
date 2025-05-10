# Inferential Statistics
# Author: Mostafa S. Abd El-Maksoud

# In this script, we will learn how to perform statistical inference in R.

# -------------------------------
# Preliminaries
# -------------------------------

# Load required packages
library("tidyverse")

# Load the dataset
data <- read_delim("data.tsv")

# -------------------------------
# One-sample t-test
# -------------------------------

# View unique hosts
unique(data %>% pull(Host))

# Get GC content of phages targeting Escherichia
gc_escherichia <- data %>% 
  filter(Host == "Escherichia") %>% 
  pull(`molGC (%)`)
gc_escherichia

# Get GC content of all phages
gc_all <- data %>% 
  pull(`molGC (%)`)
gc_all

# Perform one-sample t-test comparing GC of Escherichia phages to overall mean
t.test(gc_escherichia, mu = mean(gc_all))

# -------------------------------
# Two-sample t-test
# -------------------------------

# Get GC content of phages targeting Staphylococcus
gc_staphylococcus <- data %>% 
  filter(Host == "Staphylococcus") %>% 
  pull(`molGC (%)`)
gc_staphylococcus

# Perform two-sample t-test between Escherichia and Staphylococcus GC content
t.test(gc_escherichia, gc_staphylococcus)
