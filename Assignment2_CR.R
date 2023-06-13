# Script to let user know whether input is Armstrong number

answer <- (readline(prompt = "Please enter a three digit positive number: "))

# Check to see if input is numeric. 
if (is.na(as.integer(answer))) {
  print ("Error: Input not numeric") 
  quit(save = "no")
  }

# Convert input into integer 
answer <- as.integer(answer)

# Check if number is 3 digits
if (answer < 100 || answer > 999) {
  print("Error: Number is not three-digits.") 
  quit (save = "no")
}

digits <- as.numeric(unlist(strsplit(as.character(answer), ""))) %>%
narcissistic_1 <- sum(digits^3)
narcissistic <- answer == narcissistic_1


