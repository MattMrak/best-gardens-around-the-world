require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'
require 'pry'

class StudioGhibliFilms

    URL = "https://ghibliapi.herokuapp.com/films"

  def get_films
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    ap JSON.parse(response.body)
  end

   def film_title
         films = JSON.parse(self.get_films)
         films.collect do |film|
           film["title"]
         end
   end

end

#films = StudioGhibliFilms.new.get_films
#puts films
films = StudioGhibliFilms.new
puts films.film_title.uniq