require "httparty"
require "news-api"
require "pry"


class API

    def get_top_articles(country) 
        key = "d516b0de0724406bba9f3900ae074d27"
        url = "https://newsapi.org/v2/top-headlines?country=#{country}&apiKey=#{key}"
        response = HTTParty.get(url)
        response['articles'].each do |info|
            title = info['title']
            description = info['description']
            NewsArticles.new(title, description)
        end 
    end 

end 
