#Q1 -- What are the dates of the earliest and most recent reviews?

first_reviewed <- min(merged_data$last_review)
first_reviewed
  #OUTPUT: 2019-01-01
last_reviewed <- max(merged_data$last_review)
last_reviewed
  #OUTPUT: 2019-07-09

################################################################################################

#Q2 -- How many of the listings are private rooms?

num_private_rooms <- count(filter(merged_data, room_type == "Private room"))
num_private_rooms
  #OUTPUT: 11,356

################################################################################################

#Q3 -- What is the average listing price for all rooms (rounded to the nearest penny)?

avg_price <- round(mean(merged_data$price), digits=2)
avg_price
  #OUTPUT: ($)141.78

################################################################################################

#COMPILE RESULTS

#Construct tibble
review_dates <- tibble(first_reviewed=first_reviewed, last_reviewed=last_reviewed, 
                       num_private_rooms=num_private_rooms, avg_price=avg_price)
review_dates
  #1x4 tibble