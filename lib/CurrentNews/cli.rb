class CLI 

    def start 
        puts "Welecome to top stories around the world! Which country would you like the top stories on?"
        puts "Please type the country code:)"
        list_countries 
        input = gets.chomp 
        API.new.get_top_articles(input)
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
 

    def list_articles 
        NewsArticles.all.each.with_index(1) do |info, index|
            puts "-------------------------"
            puts "#{index}. #{info.title}"
            puts "-------------------------"
        end 
    end 

    def return_definition 
        puts "Here are some titles of top stories in this country, If you would like to see a description on one of these articles, please type the number of the article you would like to see."
        input = gets.strip.to_i
        index = input - 1
        article_selected = NewsArticles.all[index]
        puts "-------------------------"
        puts "Description: #{article_selected.description}"
        puts "-------------------------"
    end 


    def continue_or_exit
        puts "To see top stories from a different country, please type 'main menu'."
        puts "If you would like to exit, please type 'exit'."
        input = gets.strip 
        if input == "back"
            return_definition
        elsif input == "main menu"
            start
        elsif input == "exit"
            puts "Exiting, Thanks for coming!"
            exit 
        end 
            
    end 
        




end 