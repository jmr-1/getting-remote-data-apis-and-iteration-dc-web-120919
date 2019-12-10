require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
      movie_list = []

  response_hash["results"].each do |character|
      if character["name"].downcase == character_name #downcase b/c its changed to downcase
          movie_list = character["films"]  # this is an array
          puts movie_list
      end
    end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
    movie_info_array = []
    movie_list.each do |movies|
    #web request for URL
    resp_movie = RestClient.get(movies)
    response_movie_p = JSON.parse(resp_movie)

    movie_info_array << response_movie_p

  end

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
    return movie_info_array
end


def print_movies(films)
  puts "*** Movie List ***"
  # some iteration magic and puts out the movies in a nice list
  # binding.pry
films.each {|movies| puts movies["title"]}
end

def show_character_movies(character)
  # binding.pry
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
