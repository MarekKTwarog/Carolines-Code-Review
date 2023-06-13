# Script to let user know whether input is Armstrong number

answer <- as.integer(readline(prompt = "Please enter a three digit positive number: "))

if (is.na(is.numeric(answer))) {
  print ("Error: Input not numeric") 
  quit(save = "no")
  }


# Check if number is 3 digits
if (answer < 100 || answer > 999) {
  print("Error: Number is not three-digits.") 
  quit (save = "no")
}


