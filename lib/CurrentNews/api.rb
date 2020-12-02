
class API

    def get_articles_by_country(country) 
        key = "d516b0de0724406bba9f3900ae074d27"
        url = "https://newsapi.org/v2/top-headlines?country=#{country}&apiKey=#{key}"
        response = HTTParty.get(url)
        response['articles'].each do |info|
            title = info['title']
            description = info['description']
            NewsArticles.new(title, description)
        end 
    end 

    def get_articles_through_catagories(catagory)
        key = "d516b0de0724406bba9f3900ae074d27"
        url = "https://newsapi.org/v2/top-headlines?category=#{catagory}&apiKey=#{key}"
        response = HTTParty.get(url)
         response['articles'].each do |info|
             title = info['title']
             description = info['description']
             NewsArticles.new(title, description)
         end
    end 
end 
