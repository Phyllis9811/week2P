if (FALSE) {
  dictionary <- read.table("/Users/phyllisli19981111/Desktop/iXperience/week2P/R/words.txt")
}
devtools::use_data(dictionary, overwrite = TRUE)
save(dictionary, file="data/dictionary.RData")
