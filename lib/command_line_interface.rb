def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars Universe!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  return gets.chomp.downcase
end
