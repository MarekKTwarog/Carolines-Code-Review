# Script to let user know whether input is Armstrong number

# Prompt user to enter three-digit positive number
answer <- (readline(prompt = "Please enter a three digit positive number: "))

# Check to see if input is numeric, if not, print error message and quit
if (is.na(as.integer(answer))) {
  print ("Error: Input not numeric") 
  quit(save = "no")
  }
#NOTE: Good use of is.na function, could have also just used quit(), instead of quit(save = "no") for simplicity

# Convert input into integer
answer <- as.integer(answer)
# Check if number is 3 digits, if not, print error message and quit
# This will also ensure that number is a positive integer
if (answer < 100 || answer > 999) {
  print("Error: Number is not three-digits.") 
  quit (save = "no")
}
#NOTE: Good use of operand to check for values including more or less than 3 digits

# Use strsplit to split elements of the vector into substrongs. 
digits <- as.numeric(unlist(strsplit(as.character(answer), "")))
# Sum the cube of each sub string
narcissistic <- sum(digits^3)
narcissistic1 <- answer == narcissistic
#NOTE:I like the use of the unlist() function which rids you of having to reference the list using [[1]] at the end of your code string
#NOTE:I also like your use of just one variables to help determine whether the original answer is equivalent to the sum of cubes of that number, well done.

# Confirm whether or not input is a narcissistic number
if (narcissistic1) {print(paste(answer, "is a narcissistic number"))} else 
{ print(paste(answer, "is not a narcissistic number"))
}
#NOTE: Overall well done, code is easy to read, with good use of functions to complete the task.

