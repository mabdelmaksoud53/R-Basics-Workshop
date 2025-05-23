# title: "Introduction to R Syntax"
# author: Mostafa S. Abd El-Maksoud

# R is an open source programming language that is popular for statistics and data analysis. R was built by statisticians, so many common statistical operations are built into the base language.
# R also features powerful and intuitive libraries for plotting and a variety of packages for predictive modeling, making it one of the most popular languages for data science.

# R & RStudio Installation
# Go to [CRAN](https://cran.r-project.org/) to install R and [RStudio](https://posit.co/download/rstudio-desktop/) to install the RStudio IDE.

# R Interface & Appearance
# Explore the interface: Console, Script Editor, Environment, Plots, and Files panel.

## Data Types
# Decimal numbers (real numbers) in R are known as doubles.
# Doubles are the default numeric data type so when you manually enter a number in R, you are working with a double.

typeof(1)
typeof(-10.5)

# Integers are a second numeric data type that only take whole numbered values.

as.integer(1) # Convert the double 1 to integer 1
typeof(as.integer(1))

# Convert back from integer to double
as.numeric(as.integer(1))
typeof(as.numeric(as.integer(1)))

# Our first non-numeric data type is the Logical.
# values. Data that only takes on the values of True or False are also called "Boolean".
# A Logical takes on the value of TRUE or FALSE. You must type TRUE and FALSE in all capital letters for R to recognize them as logical

typeof(TRUE)
typeof(FALSE)
typeof(T)
typeof(F)
# You can create logical values with logical comparisons. R supports a variety of standard logic comparison operators including \> (greater than), \< (less than), \>= (greater than or equal), \<= (less than or equal).

20 > 20
20 >= 20
10 == 10
10 != 20
!FALSE

(2 > 1) & (10 == 9)
(2 > 1) | (10 == 9)
# Strings of text in R are known as characters. Surround text with quotation marks to create a character.

typeof("cat")
typeof("1")
typeof(as.numeric("12"))
typeof(as.character(12))

# Simple Arithmetic Operations

12 + 6 # addition
12 - 6 # subtraction
12 * 6 # multiplication
12 / 6 # division
12^6 # exponentiation
12**6 # exponentiation
12 %% 6 # modulo (get remainder)

# Variables

# A variable is a name you assign a value or object.
# After assigning a variable, you can access its associated value or object using the variable's name.
# To simply put, this is how we store data. In R, assign variables using \<- (the less than sign followed by a hyphen.).

var <- 3 + 3
x <- 10
y <- "R Workshop"
z <- (sqrt(144) == 12)

print(var)
print(x)
print(y)
print(z)

# It is possible to assign variables in R using the equals symbol = instead of \<-.
# The equal sign is used for variable assignment in many other programming languages (such as Python). One reason for using \<- besides conforming to the style preferred by the R community is that the equals sign is used in places other than variable assignment statements.
# Functions often take named arguments and when calling a function you use the = symbol to assign values to named arguments.

## Vectors or Collections

# A vector is a sequence of data elements of the same data type. You can have numeric, logical and character vectors.
# To create and store a vector with specific values, use the c() function and assign the result to a variable. c() takes a comma separated sequence of elements as input and combines them into a vector.
# You can also combine two vectors using the c() function. If you try to combine vectors of different types, R will automatically convert the vectors into the type that fits best.

# Creating a character vector for the days of the week
weekday <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
weekend <- c("Saturday", "Sunday")
days <- c(weekday, weekend)
print(days)

# Note (1)
# Vector Indexing Starts at 1
#The first element is at index position 1, the second element is at index position 2 and so on. Unlike many other programming languages, indexes in R start at 1 instead of 0.

# Note (2)
# When you print a vector to the screen, each line starts with a number in square brackets followed by vector values. The number in square brackets indicates the index of the next value listed on that line.
# You can access a specific value in a vector by typing the name of the vector and then wrapping the index associated with the value you want to access in square brackets.
days[1]

# Range of Values: Inclusive - You can access ranges of values by placing a colon : between the starting and ending indices of the range
days[1:3]

# Pulling out specific elements from Vectors
days[c(1, 3, 5, 7)]

# Subset out of a Collection - A subset of a vector is just a shorter vector. You can access a specific subset of values by wrapping a vector in the square brackets.
weekdays <- days[1:5]
weekdays

# Generate a vector using 100 random Numbers
random_data <- runif(100) # Create a vector of 100 random numbers
print(random_data)
print(length(random_data))

# Filtering of Vectors using Logical Expressions, You can also index a vector with a logical vector of the same length. - In this case, the subset is created from each index where the corresponding logical vector is TRUE. - Indexing with a logical vector is a common way to filter a numeric or character vector for values that fulfill certain criteria.
# Exclude everything except for your specified index
y <- c(1, 0, 3)
# y <- y[-2] | 
y <- y[c(1,3)]
y

# Exclude the range 2 to 9
random_data <- runif(50)
random_data_sub <- random_data[-(2:49)]
random_data_sub

# Exclude using logical expression
over_half <- (random_data > 0.5)
new_subset <- random_data[over_half]
new_subset

# Use %in% to filter a vector
my_letters <- c("a", "b", "c", "d", "a", "c")

# Get only the a's and c's
my_letters[my_letters %in% c("a", "c")]

## Vectorized Operations

# Many R functions and operations behave in a "vectorized" manner, meaning they act upon each element of a vector individually and return the result of each of the operations in a new vector.
# Vectorized operations simplify the process of performing the same calculations on related data. All the basic operators and functions we've learned so far that operate on single values work on vectors longer than length 1.
example_vector <- c(1, 2, 3)

# adds to each value in the vector
example_vector + 10

# performs subtraction on each value
example_vector - 10

# Different Ways to Generate Vectors**
x <- 1:20
y <- seq(from = 1, to = 20, by = 2)
r <- rep(1, times = 10)
s <- runif(n = 5, min = 0, max = 100)

x
y
r
s

## Control Flow

### If, Else and Else If

# An if statement checks whether some logical expression is true or false and executes a specified block of code if the logical expression is true.
# In R, an if statement starts with if, followed by a logical expression in parentheses, followed by the code to execute when the if statement is true in curly braces.
# If statements are often accompanied by else statements. Else statements come after if statements and allow you to execute code in the event that the logical expression of an if statement is false.
x <- 5
if (x > 0) {
  print("Positive number")
} else {
  print("Negative number")
}

### For Loops

# For loops are a programming construct that let you go through each item in a sequence and then perform some operation on each one.
my_sequence <- seq(0, 100, 10)

# Create a new loop over the specified items
for (item in my_sequence) {
  print(item)
}

# The next keyword causes a for loop to skip to the next iteration of the loop.
my_sequence <- seq(0, 100, 10)
for (item in my_sequence) {
  if (item < 50) { # this if statement skips items less than 50
    next
  }
  print(item)
}

# The break keyword halts the execution of the loop entirely. Use break to break out of a loop.**
my_sequence <- seq(0, 100, 10)

for (item in my_sequence) {
  if (item > 50) {
    break
  }
  print(item)
}

### While Loops

# While loops are similar to for loops in that they allow you to execute code over and over again.
# For loops execute their contents, at most, a number of iterations equal to the length of the sequence you are looping over.
# While loops, on the other hand, **keep executing their contents as long as a certain logical expression you supply remains true.**
x <- 5
iterations <- 0

# Execute as long as iterations < x
while (iterations < x) {
  print("Study")
  iterations <- iterations + 1 # Increment iterations by 1 each time the loop executes
}

### If Else on Vectors
# For example, imagine you have a vector of numbers and you want to set all the negative values in the vector to zero. One way to do it is to use a for loop with an inner if statement.
my_vect <- runif(25, -1, 1) # Generate some random data between -1 and 1

for (index in 1:length(my_vect)) { # loop through the sequence 1:25
  number <- my_vect[index] # look up the next number using indexing
  if (number < 0) { # check if the number is less than 0
    my_vect[index] <- 0 # if so, set it to 0
  }
}

print(my_vect)

#Using a for loop requires writing quite a bit of code and loops are not particularly fast.
# Instead we could have used R's ifelse() function to the same thing in a vectorized manner. ifelse() takes a logical test as the first argument, a value to return if the test is true as the second argument and a value to return if the test is false as the third argument:
data <- c(11, 7, NA, 9, NA, 13, 15, NaN, 19, 17, 14, NaN)

# Use if else statements to conditionally fill these bad values with the mean

ifelse(is.na(data) | is.nan(data), # logical check
  mean(data, na.rm = T), # value to set if TRUE
  data
) # value to set if FALSE

# Chaining ifelse to perform multiple operations
data <- c(11, 7, NA, 9, NA, 13, 15, NaN, 19, 17, 14, NaN)
d <- ifelse(is.na(data) | is.nan(data), "missing", ifelse(data < 10, "low", ifelse(data < 15, "medium", "high")))
table(d)

## Functions

# A function is just an R object that runs a per-defined snippet of code, usually on some input that you supply to it.
# A function can return an output based on the input you provide. For example, the sum() function built into R simply takes a numeric vector as input and returns their sum as output.
# Built-in functions and packages can take you a long way in R, but it can be useful to define your own functions to perform specific tasks outside the scope of built-in functions.
# Create your own function in R using this syntax:

# Assign the function() to a name and declare arguments within ()
new_function <- function(arguments) {
  # Write a function body within the {} to execute
  for (x in 1:arguments) {
    print("This is a function!")
  }
}
# Here is an actual example
exampleFunction <- function(x, y) {
  c(x + 1, y + 10)
}

exampleFunction(2, 4)

# Functions with Return Value**
# Functions in R return the last expression evaluated by default.
add_10 <- function(number) {
  number + 10
  # return (number+10)
}

add_10(5)

add_20 <- function(number) {
  return(number + 20) # Exit and return specified value
  number + 10 # The function exits before running this line
}
add_20(25)

## Function Arguments
# A function can have one or more named arguments. You can assign a default value to an argument when creating a function with the argument_name = argument_value syntax.

sum_3_items <- function(x, y, z, print_args = TRUE) {
  if (print_args) {
    print(x)
    print(y)
    print(z)
  }
  return(x + y + z)
}
sum <- sum_3_items(1, 2, 3)
sum2 <- sum_3_items(10, 20, 30, print_args = FALSE)

#Ellipsis
# The ... argument collects all extra arguments passed to a function that are not matched. The ... argument can be used in functions where the number of arguments is not known in advance.
addition_function <- function(...) {
  total <- 0
  # list (...) extracts the arguments to a list
  for (value in list(...)) {
    # Add each argument in ... to the total
    total <- total + value
  }
  total
}

addition_function(2, 4, 6, 8, 10, 12, 14)