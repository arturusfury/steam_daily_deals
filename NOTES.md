# Operation Methods

user types steam-daily-deals to start the program
steam-daily-deals calls the call method

call method displays our ASCII banner then calls the menu method

menu method waits for a user input
if the input is exit, closes the program

if the input is list, calls the list_deals method

if the input is a number that matches an index in our @deals array we display that game's information

list_deals method calls a scrape_main method
scrape_main uses nokogiri to pull the daily deal information css(main_cluster_scroll)
from there it will scrape the app page url, css(discount_final_price), and css(main_cap_status or css(game_description_snippet)
then calls the scrape_deal method

scrape_deal grabs the name css(apphub_AppName), css(release_date date), css(user_review_summary_row game_review_summary) and css(user_review_summary_row game_review_summary responsive_hidden)
scrape_deal will also grab the css(glance_tags popular_tags)
