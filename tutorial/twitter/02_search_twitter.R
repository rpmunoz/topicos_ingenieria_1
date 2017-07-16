library("rtweet")
source("crypt.R")

key_file <- file.path(path.expand("~"), "key.RData")
credentials_file <- file.path(path.expand("~"), "twitter_credentials.dat")

if (file.exists(key_file)){
  load(key_file)
} else {
  print("Execute script 01_encriptar_key.R")
}

if (file.exists(credentials_file)) {
  credentials <- read.aes(filename = credentials_file, key = key)
} else {
  print("Execute script 01_encriptar_key.R")
}

twitter_token <- create_token(app = "rtweet_token", consumer_key = credentials$consumer_key, consumer_secret = credentials$consumer_secret)

search_term <- "data science"
search_number <- 10
start_date <- "2017-01-01"
end_date <- "2018-01-01"
rt <- search_tweets(search_term, n=search_number, since=start_date, until =end_date)
View(rt)
