# This is a comment
# Comments won't be executed

# creating a vector with three states for the variable "coat"
# in a table, the vector is a column and the variable is the header of the column
#  cats <- data.frame(coat = c("calico", "black", "tabby"))

# same as before but with a second column, adding weight as as a variable
# using enter keeps things together
#  cats <- data.frame(coat = c("calico", "black", "tabby"),
#                   weight = c(2.1, 5, 3.2))

# adding a third variable
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5, 3.2),
                   like_string = c(1, 0, 1))
# pressing cmd+Enter puts the variables in the environment
# reading the different variables can be done with cats$variable,e.g.:
# cats$weight

# the data can also be retrieved from a file (e.g. comma seperated csv file)
# pressing tab in ("tab") gives you options
# cats_file <- read.csv("source/cat_dataset.csv")

#one can start calculating with the variables, e.g.:
#cats$weight*1000

#using the paste function allows us to use the variables as strings:
paste(cats$coat)
# we can use this as follow:
paste("This cat has the following coat: ", cats$coat)

# different variables can be used to calculate, e.g.:
# cats$weight + cats$like_string

# to add new variable to a previous dataframe, use cbind
cats <- cbind(cats, paws = c(4 ,4, 4))

# to introduce a new row (in this case a cat), use rbind
# cats <- rbind(cats, c("white", 2, 1, 4)) 
# this doesn't work as white is not a number and c expects a vector. As this vector combines numers and characters, it changes all numbers in the environment to characters.

#To add a new cat, we create a list.
cats <- rbind(cats, list("white", 2, 1, 4)) 
# but at this point the factor is not working

# explore values:
typeof (c(TRUE, 1))
  # a capital L behind the number makes the double an integer
typeof (c(TRUE, 1L))
  # continue exploring
list (TRUE, 1)
list (list(1,2), "The first element is a list")

# creating a sequence; gets us a vector with a row of numbers from 10 to 20:
seq(10,20)

# creating a sequence of odd numbers using an additional argument:
seq(1,11,2) # first number 1, last number 11, step between the numbers
# the first two give the range of the sequence, the third number gives the steps between the numbers of the sequence
seq(2,10,3)

# --- use of head and tail of vectors ----
# creating a very big sequence,using a variable
very_large_vector <- seq(13,200)

# only showing the first few numbers (by default the first 6 numbers):
head(very_large_vector)

# showing the first n numbers of the vectors
head(very_large_vector, n=10)

# same from the other side:
tail(very_large_vector)

# checking how many numbers are stored in the vector/sequence
length(very_large_vector)


# --- named vectors ---

# create a vector
my_named_vector <- c(13, 29, 72)

# create the name for the vector (changes "num" to "Named num")
names(my_named_vector) <- c("a", "b", "c")

# (reading out the vector - with this you can see the change between the created vector and the named created vector)
my_named_vector

# ----- back to the cats ----

# fixing the factors:
coats <- c("black", "calico", "tabby", "tabby")

# getting the information about the string
str(coats)

# transforming strings into coats and changing it to a factor
CATegories <- factor(coats)

# gives characters
str(coats)

# gives factors
str(CATegories)

# checking the current levels of CATegories
levels(CATegories)

# add "white" to the levels of CATegories
levels(CATegories) <- c(levels(CATegories), "white")

# checking if it worked (by checking the levels)
levels(CATegories)

# so far we have 3 factors of coats in cats
levels(cats$coat)

# adding another factor of coats
levels(cats$coat) <- c(levels(cats$coat), "white")

# check that it worked:
levels(cats$coat)

# continue to do something - try out
cats[1]
cats[2,2]
cats[3,1]
# first number refers to the row, second to the value

# setting a new value (has to be in the factor levels):
cats[4,1] <- "white"
# to check:
cats[4,1]

# one could change the fourth value to lack instead of white:
cats[4,1] <- "black"
# or one could change the number of paws of the third cat to two
cats[3,4] <- 2 # if it is a number, then no quotation marks, if it is a character, then use quotation marks

# change it back to four
cats[3,4] <- 4

# everything can be checked in the table, by doubleclicking on "cats" in the global environment

# read all the values of row 2
cats[2,]


# ------ Matrix --------
matrix_example <- matrix(0, nrow = 3, ncol = 6)
matrix_example

another_matrix <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
another_matrix

#by default it organises matrixes by columns. to change it to rows:
matrix_by_rows <- matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)
matrix_by_rows

# check dimensions of the matrixes
dim(matrix_example)
dim(matrix_by_rows)
dim(another_matrix)

length(matrix_example)



# ----- Append a dataframe to another one -------

# add the cats dataframe to the cats dataframe (all factors are the same):
rbind(cats, cats)

# stores it as a new dataset
doublecats <- rbind(cats,cats)
