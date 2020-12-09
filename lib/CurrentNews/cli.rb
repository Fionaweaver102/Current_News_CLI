
class CLI 

    def start 
        puts "\nWelecome to top stories around the world! Would you like to see headlines by Country, or Category?\n"
        main_menu_options
    end 

    def main_menu_options 
        print "Please enter either 'Country' or 'Category':"
        input = gets.chomp
        if input == "Country" || input == "country"
           list_countries 
           return_definition
           continue_or_exit
        elsif input == "Category" || input == "category"
            list_categories
            return_definition
            continue_or_exit
        else 
            invalid_choice
            main_menu_options
        end 
    end 

    def list_countries
        country_codes = {"United States" => "US", "Australia" => "AU", "United Kindom" => "GB", "Canada" => "CA", "Irealand" => "IE", "New Zealand" => "NZ", "Austria" => "AT", "Bulgaria" => "BG", "Brazil" => "BR", "France" => "FR" }
        country_codes.each.with_index(1){|country, index| puts "#{index}. #{country.join(" = ")}"}
         puts "Please enter a country by its country code... (ex. 'US')" 
         print "Enter Code: "
        input = gets.chomp 
         matched_codes = country_codes.select {|country, code| code == input || code.downcase == input}
         if matched_codes.any? 
            API.new.get_articles_by_country(input)
            list_articles
         else 
            invalid_choice
            list_countries
         end  
    end 

    def list_categories 
        categories = ["business", "entertainment", "health", "sports", "technology"]
        categories.each.with_index(1){|categories, index| puts "#{index}. #{categories}"}
        puts "Please enter a category by it's name... (ex. 'health')"
        print "Please enter a Category: "
        input = gets.chomp 
        matches_categories = categories.select{|category| category == input || category.capitalize == input}
        if matches_categories.any? 
            API.new.get_articles_through_catagories(input)
            list_articles
        else 
            invalid_choice
            list_categories
        end 
    end 

    def list_articles
        NewsArticles.all.each.with_index(1) do |info, index|
            puts "-------------------------"
            sleep(1)
            puts "#{index}. #{info.title}"
            puts "-------------------------"
        end 
        puts "\nHere are some titles of top stories, to see a description on one of these articles, please enter the number of the article you would like to see. \n"
    end 

    def return_definition 
        print "Enter number: "
        input = gets.chomp.to_i 
        input_to_index = input - 1 
        matches_article = NewsArticles.all.select.with_index{|info, index| index == input_to_index}
        if matches_article.any? 
            article_selected = NewsArticles.all[input_to_index]
        puts "\n-------------------------"
        sleep(1)
        puts "Description: #{article_selected.description}"
        puts "-------------------------"
        elsif input == 'exit'
            exit 
        else 
            invalid_choice
            return_definition
        end 
    end 

    def invalid_choice 
        puts "\nSorry! That was an invalid choice. Please try again.\n"
    end 
    

    def continue_or_exit
        puts "\nTo see top stories from a different country, or category, please type 'main menu'.\n"
        puts "If you would like to exit, please type 'exit'."
        input = gets.strip 
        if input == "main menu"
            main_menu_options
        elsif input == "exit"
            puts "\nExiting...\n"
            sleep(2)
            puts "Thanks for coming!" 
        else 
            invalid_choice
            continue_or_exit
        end 
            
    end 

end 