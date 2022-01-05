# english-dict
Create an R character vector of English words from Project Gutenberg/Webster's Dictionary

## [`get_words.R`](https://github.com/tystan/english-dict/blob/main/get_words.R)

This script downloads the [Plain Text UTF-8 Webster's Dictionary](https://www.gutenberg.org/ebooks/29765) avalaible at [Project Gutenberg](https://www.gutenberg.org/about/) and tries to extract the English words using a super simple regular expression (and ignore the word's defintions).


## [`dict_words.RData`](https://github.com/tystan/english-dict/blob/main/dict_words.RData)
This is an R Data file that can be loaded into an R session simply by clicking it (or use `load("dict_words.RData")` in an R session). The file contains the R character vector `dict_words` with approximately 100,000 words.


For example to extract the first 100 words and then 100 words at random do the following:
```r
# once dict_words.RData is downloaded or you have run get_words.R
# (make sure dict_words.RData is in your working dir or you prepend the relative path to its location)
load("dict_words.RData") 

# first 100 words
dict_words[1:100]

# 100 random words
dict_words[sample(x = length(dict_words), size = 100)]
```

