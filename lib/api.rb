require 'httparty'
require_relative 'ghibli-data.rb'
class API



    def initialize
        @url = "https://ghibliapi.herokuapp.com/films"
    end


    def get_ghibli_data
        ghibli_hash = HTTParty.get(@url)
        ghibli_array = ghibli_hash
        self.create_ghibli_objects(ghibli_array)
    end

    
    def create_ghibli_objects(ghibli_array)
        ghibli_array.each do |ghibli_hash|
            GhibliData.new(ghibli_hash)
        end
    end
end




