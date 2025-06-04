#load libraries
suppressMessages(library(dplyr))
options(readr.show_types = FALSE)
library(readr)
library(readxl)
library(stringr)
library(dplyr)
library(lubridate)

#import the data
price_data = read.csv("airbnb_price.csv")
room_data = read_excel("airbnb_room_type.xlsx")
review_data = read_tsv("airbnb_last_review.tsv")
  #for each, 25,209 observations, 3 variables


#DATA CLEANING

#Fix case inconsistencies in 'room_type' of "room_data"
room_data$room_type <- str_to_sentence(room_data$room_type)

#Convert 'last_review' from "chr" to "Date"s
review_data$last_review <- as.Date(review_data$last_review, format="%B %d %Y")
class(review_data$last_review)
# --> "Date" -- GOOD

#Remove the "dollars" string from 'price' & convert it from "chr" to "numeric"
price_data$price <- as.numeric(str_remove_all(price_data$price, "dollars"))


#MERGE DATA
#use the 'listing_id' variable
merged_data <- full_join(full_join(price_data, room_data, by="listing_id"), review_data, by="listing_id")
merged_data
  #25,209 observations, 7 variables