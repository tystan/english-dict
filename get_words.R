
### Local download
# accessed from https://www.gutenberg.org/ebooks/29765 on 5-Jan-2022
# see file for allowable usage
# whole_dict <- readLines(con = file.path("data/gutenberg-dictionary.txt"), encoding = "UTF-8")

### Direct download from web (takes a little while depending on internet speed)
# see: https://www.gutenberg.org/files/29765/29765-ReadMe.txt
whole_dict <- readLines(con = "https://www.gutenberg.org/ebooks/29765.txt.utf-8", encoding = "UTF-8")

# how big (~75 MB)
format(object.size(whole_dict), "MB")

# almost a million lines
(n_lines <- length(whole_dict))

# just for printing progress (each value is a percent progress starting at 0%)
checkin_vals <- as.integer(seq(1, n_lines, length = 101))

# this will contain indexes of words in dictionary to keep
kp_list <- c()

# for each line check whether the entire line is uppercase letters
# (i.e. a word, not part of the dictionary definition)
for (i in 1:n_lines) {

  # print progress
  if (i %in% checkin_vals) {
    cat(which(checkin_vals %in% i) - 1, "% complete\n", sep = "")
  }

  # regular expression check for word (with spaces and/or hyphens)
  is_word <- grepl("^[A-Z \\-]{2,}$", whole_dict[i])

  # update list of word indexes
  if (is_word) {
    kp_list <- c(kp_list, i)
  }

}

# this is the character vector of found words
dict_words <- whole_dict[kp_list]

# get rid of duplicates
dict_words <- unique(dict_words)

# how many words? (~100k)
(n_words <- length(dict_words))
# size? (~7 MB)
format(object.size(dict_words), "MB")

# have a peak
dict_words[1:100]
dict_words[sample(x = n_words, size = 100)]

# save a local copy of the words
save(dict_words, file = file.path("dict_words.RData"))



### TESTING
# grepl("^[A-Z \\-]{2,}$", "A")
# grepl("^[A-Z \\-]{2,}$", "A-")
# grepl("^[A-Z]{2,}$", "BB")
