require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  total_films = []
  new_page = "http://www.swapi.co/api/people/"
    while new_page != nil
      all_characters = RestClient.get(new_page)
      character_hash = JSON.parse(all_characters)
        character_hash.each do |categories, characters|
          if categories == "results"
            characters.each do |profile|
              if profile["name"].downcase == character
                 total_films << profile["films"]
               end
             end
           end
         end
         character_hash.each do |categories, characters|
           if categories == "next"
             new_page = characters
           end
         end
    end
    return total_films.flatten
end


def parse_character_movies(films_hash)
  films_hash.each_with_index do |url, index|
    all_films = RestClient.get(url)
    film_hash = JSON.parse(all_films)
    puts "#{index+1}. #{film_hash["title"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
