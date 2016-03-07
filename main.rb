# calls the sinatra tools
require "sinatra"
require "sinatra/reloader" if development?

# when get an home are run it sets the @translate to string
get "/" do
	@translate = "Pick your word to translate"
	erb :home
end

# when the post home is run it set the chain reaction off with 
# the method to chnage the value of @translate
post "/" do

	# array to push the translated words to
	pig_translation = []

	# makes the user input an array with 
	@translate = params[:translate].downcase.split(" ")


	# goes through each word in array and performs translation
	@translate.each do |word|
	    
	    if word.start_with?("a", "e", "i", "o", "u")
	        @translate = "#{word}ay"
	    else
	        start_letter = word.slice(0)
	        word.slice!(0)
	        @translate = "#{word}#{start_letter}ay"
	    end

	    # puts the result to the translation array
	    pig_translation.push(@translate)
	    
	end

	#this makes the array a string again
	@translate = pig_translation.join(" ")

	erb :home
end
