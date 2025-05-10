# Data structure - Vectors, Matrices, Lists & Dataframes
# Author: Mostafa S. Abd El-Maksoud

# In this script, we will learn how to handle different types of data structure in R.

# -------------------------------------------------------------------------------
# R provides several ways for grouping objects:
# - Vector: Collection of objects with the same data type.
# - Matrix: Table consisting of objects with the same data type.
# - List: Collection of objects with possibly different data types.
# - Dataframes: A table or 2D structure where each column can be of different type.
# -------------------------------------------------------------------------------

# ---------------------------
# Vector
# ---------------------------

# Create a vector using the c() function:

amino_acids <- c("methionine", "leucine", "alanine", "valine", "glutamine",
                 "threonine")

# Accessing items in a vector
amino_acids[1] # Access the first element
amino_acids[2] # Access the second element

# Combine two vectors
add_amino_acids <- c("glycine", "cysteine", "serine")
many_amino_acids <- c(amino_acids, add_amino_acids)
many_amino_acids

# ---------------------------
# Matrix
# ---------------------------

# Create a matrix
amino_acids_matrix <- matrix(c("methionine", "leucine", "alanine", "valine",
                               "glutamine", "threonine"), nrow=3, ncol=2)
amino_acids_matrix

# Add rows
amino_acids_matrix <-  rbind(amino_acids_matrix, c("proline", "arginine"))
amino_acids_matrix

# Add columns
amino_acids_matrix <-  cbind(amino_acids_matrix, c("histidine", "phenylalanine",
                                                   "tryptophan", "selenocysteine"))
amino_acids_matrix

# Access matrix items
amino_acids_matrix[1, 2] # First row, second column
amino_acids_matrix[4, 3] # Fourth row, third column

# Logical checks with matrices
numbers <- matrix(c(2, 4, 6, 8, 10, 12, 14, 16, 18), nrow=3, ncol=3)
any(numbers < 6)
any(numbers < 1)
all(numbers < 20)
all(numbers < 5)

# Naming dimensions
colnames(numbers) <- c("Treatment 1", "Treatment 2", "Treatment 3")
rownames(numbers) <- c("Patient 1", "Patient 2", "Patient 3")
numbers

# Matrix operations
numbers1 <- matrix(c(2, 4, 6, 8, 10, 12, 14, 16, 18), nrow=3, ncol=3)
numbers2 <- matrix(c(12, 14, 16, 18, 20, 22, 24, 26, 28), nrow=3, ncol=3)

numbers1 + numbers2
numbers1 - numbers2
numbers1 * numbers2
numbers1 / numbers2

100 * numbers1 # Scalar multiplication
t(numbers1)    # Transpose

# ---------------------------
# List
# ---------------------------

# Create a list
assorted_list <- list("proline", "methionine", 1, 2)
assorted_list

# Accessing list items
assorted_list[1]    # Returns a sublist
assorted_list[[1]]  # Returns the item itself

# Summary of list
summary(assorted_list)

# ---------------------------
# Dataframe
# ---------------------------

# Creating a data frame
a <- c(1, 2, 3, 4)
b <- c("R", "Python", "PHP", "JS")
c <- c(TRUE, FALSE, TRUE, FALSE)

my_frame <- data.frame(a, b, c)
my_frame

# Rename columns and rows
colnames(my_frame) <- c("c1", "c2", "c3")
rownames(my_frame) <- c("r1", "r2", "r3", "r4")
my_frame

# Load dataset from file
dataset <- read.delim("data.tsv")

# Summary of dataframe
str(dataset)
summary(dataset)

# Other summary operations
dim(dataset)
nrow(dataset)
ncol(dataset)

# Look at the beginning and end of the data frame
head(dataset, 5)
tail(dataset, 5)

# ---------------------------
# Dataframe Indexing
# ---------------------------

head(dataset$model)
head(dataset[["model"]])
head(dataset[[1]])

# Access specific values
dataset[2, 6]       # Value at row 2 column 6
dataset[2, ]        # Entire second row
dataset[, 6]        # Entire sixth column
dataset[, "mpg"]    # Column by name

# ---------------------------
# Filtering of Dataframes
# ---------------------------

# Subset based on condition
subset(dataset, (dataset$hp > 160))