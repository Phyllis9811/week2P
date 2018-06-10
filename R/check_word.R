dictionary <- read.table("/Users/phyllisli19981111/Desktop/iXperience/week2P/R/words.txt")
#' Check whether the word is valid
#'
#' @param word
#'
#' @return T or F
#' @export
#'
#' @examples
#' check_word("love")
check_word <- function(word) {
  word <- tolower(word)
  word <- gsub("\n", "", word)
  word <- gsub(" ", "", word)
  data(dictionary)
  if (any(dictionary == word))
    #print("True")
    TRUE
  else
    #print("False")
    FALSE
}

#' Find the length of the word
#'
#' @param word
#'
#' @return the length of the word
#' @export
#'
#' @examples
#' find_length("love")
find_length <- function(word) {
  if (check_word(word))
    print(nchar(word))
  else
    print("Please enter a valid word!")
}

#' Find the corrections of a mispelled word
#'
#' @param word
#'
#' @return the corrections of the word
#' @export
#'
#' @examples
#' find_corrections("lovve")
find_corrections <- function(wrongWord) {
  possibilities <- c()
  #remove each character in the word
  for (i in 1:nchar(wrongWord)) {
    first = substr(wrongWord, 0, i)
    second = substr(wrongWord, i+2, nchar(wrongWord))
    newWord = paste0(first, second)
    if (any(dictionary == newWord) & !(newWord %in% possibilities))
      possibilities <- c(possibilities, newWord)

    #add a character from a-z at each position of the word
    second <- substr(wrongWord, i+1, nchar(wrongWord))
    for (j in 1:26) {
      newWord = paste0(first, letters[j])
      newWord = paste0(newWord, second)
      if (any(dictionary == newWord) & !(newWord %in% possibilities))
        possibilities <- c(possibilities, newWord)
    }
    newWord = paste0(first, "\'")
    newWord = paste0(newWord, second)
    if (any(dictionary == newWord) & !(newWord %in% possibilities))
      possibilities <- c(possibilities, newWord)
  }

  #swap the position of two characters
  for (k in 1:nchar(wrongWord)) {
    if (length(wrongWord) > 1) {
      before = substr(wrongWord, 0, k-1)
      adj1 = substr(wrongWord, k, k)
      adj2 = substr(wrongWord, k+1, k+1)
      after = substr(wrongWord, k+2)
      swapped = paste0(before, adj2)
      swapped = paste0(swapped, adj1)
      swapped = paste0(swapped, after)
      if (any(dictionary == newWord) & !(newWord %in% possibilities))
        possibilities <- c(possibilities, swapped)
    }
  }
  print(possibilities)
}


