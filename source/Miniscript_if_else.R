if (3 == 4) {
  print("The world has gone crazy")
} else {
  print("Everything is ok")
}



# can combine several states
if (3 == 3 & FALSE) {
  print("The world has gone crazy")
} else {
  print("Everything is ok")
}


# ------- creating a function with a name --------
change_to_millions <- function(my_number){
  return (my_number / 10^6)
}
change_to_millions(10^12)