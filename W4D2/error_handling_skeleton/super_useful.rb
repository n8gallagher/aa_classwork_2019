# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "must be convertible to an integer"
    str = gets.chomp
    retry
  end
end

class CoffeeError < StandardError


end
# PHASE 3
FRUITS = ["apple", "banana", "orange"].freeze

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise CoffeeError
  end
  

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue CoffeeError
    puts "retries require more coffee"
    input = gets.chomp
    retry if input == "coffee"
  # end

end  

# PHASE 4
class BestFriend
  attr_accessor :name, :yrs_known, :fav_pastime
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    if @yrs_known < 5
      raise NewFriendError
    end

    raise NoNameError if @name.length <= 0
    raise NoPasttimeError if @fav_pastime.length <= 0

  rescue NewFriendError
    puts "please enter real friendship (at least 5 years)"
    yrs_known = gets.chomp.to_i
    retry

  rescue NoNameError
    puts "Please enter a friend name longer than 0 chars"
    name = gets.chomp
    retry

  rescue NoPasttimeError
    puts "Enter a past time over 0 chars"
    fav_pastime = gets.chomp
    retry
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

class NewFriendError < StandardError

end 

class NoNameError < StandardError

end

class NoPasttimeError < StandardError

end


