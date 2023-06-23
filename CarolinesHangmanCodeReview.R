
########CODE REVIEW ALL THE WAY AT THE BOTTOM OF SCRIPT############

# Assignment 3 - Hangman

#' Project plan
#' Create dictionary of words and save as txt file in working directory
#' Choose random words from dictionary each round
#' Prompt user to enter character
#' Use defensive coding to ensure (1)it is a character (2) they've only entered 1 character (3) accept both upper/ lower case
#' Tell user if input was correct
#' If correct - visually demonstrate where in the word does the correct letter go



#' Prepare a dictionary of words to choose from and save in a txt file
#' Upload dictionary to working directory 
dictionary <- readLines("WordsHangMan.txt")
#REVIEW NOTE: I like that you made it so that anyone can use their own dictionary
#'to play a more personalized game. The scan function can also be used instead of readLines()
#'that way you dont get error messages if your text file has gaps in between words.

# Ensure that the secret word is randomly selected from the dictionary of words
secret_word <- sample(dictionary, 1)
#REVIEW NOTE:good


# Inform user about length of the word
characters <- nchar(secret_word)
print("You can do this! Enter a letter one by one and guess the secret word!")
print(paste("The secret word has", characters, "characters"))
# Inform user about the number of wrong guesses allowed 
print("You have 5 tries.")
#REVIEW NOTE:This is good but also you could have made it so the users attempts
#'vary based on the length of the word, could do "attempts <- characters + 2"
#'for example. Could have also used length function to get number of letters.

# Provide user instructions and information about word/ number of guesses allowed
guessed_letters <- vector("character", nchar(secret_word))
guessed_letters[] <- "_"
tries <- 0
max_tries <- 50



# Ask user for input
# Provide user with visual cue of how they are progressing
while ("_" %in% guessed_letters) {
  cat("Secret word: ", paste(guessed_letters, collapse = " "))
  answer <- readline("Please guess a letter: ")
  
  
  
  
  # Ensure user only enters one letter 
  # If not, show error message. 
  
  if (nchar(answer) != 1) {
    cat("Uh oh! Please enter a single letter. ")
    next
  }
  
  
  
  # Confirm user has entered a letter
  # Allow for both upper and lower case letters 
  # If not, show error message. 
  
  if (!grepl("[A-Za-z]", answer)) {
    cat("Oops, invalid input. Enter a letter! ")
    next
  }
  
  
  
  # If user guesses the same letter, make sure this doesn't count
  if (answer %in% guessed_letters) {
    cat("Oh no! You've already guessed that letter. Try another! ")
    next
  }
  
  # If user guesses letter correctly, let them know, and ask for another letter
  # Update visual cue so that user can see where in the word their correct guess belongs
  
  if (answer %in% strsplit(secret_word, "")[[1]]) {
    cat("Woah! Correct guess!\n")
    matching_indices <- which(strsplit(secret_word, "")[[1]] == answer)
    guessed_letters[matching_indices] <- answer
  } else {
    cat("Incorrect guess. Try again! ")
    tries <- tries + 1 # If incorrect, ask user to try again. Using a loop function is best for this
    
    
    
    # End of loop    
    # Let user know how many remaining tries they have    
    remaining_tries <- max_tries - tries
    if (remaining_tries > 0) {
      cat("Remaining tries:", remaining_tries, "; ")
    } else {
      cat("Nice try! Unforunately you've run out of guesses. The secret word was: ", secret_word)
      break #if user has exhausted max tries, reveal secret word
    }
  }
}
# If user guesses the secret word, inform them
if (!("_" %in% guessed_letters)) {
  cat("Amazing! You've guessed the secret word:", secret_word)
}  


#CODE REVIEW NOTES:
#' No line of code that allows for capital letters to count as correct guesses, 
#' could have used tolower() function which converts capital inputs to lower case.
#' 
#' Good use of !grepl() function to check is user input is not a letter
#' 
#' Great use of which() and strsplit() functions to replace the indices when
#' correct letter is inputted
#' 
#' Interesting way of tracking the amount of attempts left by adding +1 to tries 
#' variable and then subtracting the tries variable from the max tries variable.
#' 
#' For when the user guesses the word, instead of there being just a congratulations
#' message, for some reason this entire line of code is shown:
#'  > # If user guesses the secret word, inform them
#'  if (!("_" %in% guessed_letters)) {
  #+   cat("Amazing! You've guessed the secret word:", secret_word) .... [TRUNCATED] 
  #Amazing! You've guessed the secret word: while
#' This happens when using the source button to run the code, when I highlight the entire
#' script and run it then no congratulations message is generated at all if the word is
#' guessed, instead the "Woah! Correct guess!" line is generated.
#' 
#' Good idea with the use of dictionary.txt allowing every user to use their 
#' own dictionary rather than having to use yours.
#' 
#' Punctuation and foreign symbols not accepted which is good
#' 
#' One thing that could be changed is the variable for your secret word showing up
#' in the environment pane and exposing the secret word.
#' 
#' To combat the issue with the congratulations not being printed, could add a 
#' line earlier in the code that checks if the user input the entire word then
#' it would supersede the other code and would generate the congratulations message
#' 
#' Changing line 39 to: guessed_letters <- vector("character", characters)
#' and changing line 107 to: if (all(guessed_letters != "_")) {
#.   cat("Amazing! You've guessed the secret word:", secret_word)
#.  break
#}
#}
#will fix the problem.
#' Overall the code was well done but the congratulations message needs to be fine
#' tuned, the code was very clean, the comments were also very clean and concise.
#' Most importantly the game worked as it should other than th game not recognizing
#' capital letters as correct guesses. Very good job overall!! :D
#' 