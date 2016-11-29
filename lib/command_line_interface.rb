require_relative 'api_communicator.rb'

def welcome
  "HI!"
end

def get_character_from_user
  puts "Please enter a character:"
  character = gets.chomp.downcase
   until show_character_movies(character) != []
    puts "Please enter another name:"
    character = gets.chomp.downcase
  end
end

welcome
get_character_from_user
