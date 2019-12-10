def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars API"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  return character = gets.chomp.downcase
end

