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
# this doesn't work as white is not a number - more complicated...
