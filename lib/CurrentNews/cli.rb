require 'pry'

class CLI 

    def start 
        puts "\nWelecome to top stories around the world! Would you like to see headlines by Country, or Category?\n"
        main_menu_options
    end 

    def main_menu_options 
        print "Please enter either 'Country' or 'Category':"
        input = gets.chomp
        if input == "Country" || input == "country"
           country_it_is
        elsif input == "Category" || input == "category"
            categories_it_is
        elsif input == 'exit'
            exiting 
        else 
            invalid_choice
            main_menu_options
        end 
    end 

    def categories_it_is 
        list_categories
        puts "Please enter a category by it's name... (ex. 'health')"
        print "Please enter a Category: "
        input = gets.chomp 
        API.new.get_articles_through_catagories(input)
        list_articles
        return_definition
        continue_or_exit
    end 

    def country_it_is 
        list_countries
        puts "Please enter a country by its country code... (ex. 'US')" 
        print "Enter Code: "
        input = gets.chomp 
        API.new.get_articles_by_country(input)
        list_articles
        return_definition
        continue_or_exit
    end 

    def list_countries 
        country_codes = ["United States - US", "Australia - AU", "Austria - AT", "United Kindom - GB", "Canada - CA", "Colombia - CO", "Irealand - IE", "New Zealand - NZ", "Norway - NO", "Sweden - SE"]
        country_codes.each.with_index(1) do |country, index|
            puts "#{index}. #{country}"
        end 
    end 

    def list_categories 
        categories = ["business", "entertainment", "health", "sports", "technology"]
        categories.each.with_index(1) do |categories, index|
            puts "#{index}. #{categories}"
        end 
    end 

    def list_articles 
        NewsArticles.all.each.with_index(1) do |info, index|
            puts "-------------------------"
            puts "#{index}. #{info.title}"
            puts "-------------------------"
        end 
            puts "\nHere are some titles of top stories, If you would like to see a description on one of these articles, please enter the number of the article you would like to see.\n"
    end 

    def return_definition 
        print "Enter number: "
        input = gets.strip.to_i
        index = input - 1
        article_selected = NewsArticles.all[index]
        puts "-------------------------"
        sleep(1)
        puts "Description: #{article_selected.description}"
        puts "-------------------------"
    end 

    def invalid_choice 
        puts "Sorry! That was an invalid choice. Please try again."
    end 
    
    def exiting 
        puts "\nExiting...\n"
        puts "Thanks for coming!"
    end 

    def continue_or_exit
        puts "\nTo see top stories from a different country, or category, please type 'main menu'.\nexit"
        puts "If you would like to exit, please type 'exit'."
        input = gets.strip 
        if input == "main menu"
            main_menu_options
        elsif input == "exit"
            exiting 
        else 
            invalid_choice
            continue_or_exit
        end 
            
    end 

end 