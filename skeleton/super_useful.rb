# PHASE 2
def convert_to_int(str)
  # begin rescue clause to wrap integer operation
  # rescue should set argument error
  # should print some helpful message
  # in what case can str not be converted?
  # return nil if str contains other characters than 0-9
  begin 
    Integer(str)
  rescue 
    puts "can not convert #{str} as it is not a digit!"
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError ; end 

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else  
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin 
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError
    puts "coffee is not a fruit but i'll take it!"
    puts "try again..."
    retry
  end  
end 

# PHASE 4
class YearsKnownError < StandardError; end 
class BlankArgumentError < StandardError; end

class BestFriend 
  def initialize(name, yrs_known, fav_pastime)
    raise StandardError if yrs_known < 5
    raise BlankArgumentError if name.length == 0 || fav_pastime.length == 0 
    
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


