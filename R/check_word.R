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




