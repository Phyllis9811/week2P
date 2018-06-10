library(week2P)

data(dictionary)
context("Check word")

test_that("validity of a word", {
  expect_equal(check_word("love"), TRUE)
  expect_equal(check_word("lovee"), FALSE)
})

context("Find length")

test_that("find length of the word", {
  expect_equal(find_length("love"), 4)
  expect_equal(find_length("lovee"), "Please enter a valid word!")
})
