# Print the string "Hello, world."
puts "Hello, world."
puts "-----------------------------------"

# For the string "Hello, Ruby." find the index of the word "Ruby"
puts "Hello, Ruby.".index("Ruby")
#=> 7
puts "-----------------------------------"

# Print your name ten times
x=0
while x<=10
  puts "Alan"
  x= x+1
end
puts "-----------------------------------"

# Print the string “This is sentence number 1,” where the number 1
# changes from 1 to 10.
y=1
while y<=10
  puts "This is sentence number #{y}"
  y= y+1
end
puts "-----------------------------------"

# Bonus problem: If you’re feeling the need for a little more, write
# a program that picks a random number. Let a player guess the
# number, telling the player whether the guess is too low or too high.
# puts "Guess a number from 0 to 9"
answer = rand(10)
guessed = gets.to_i
while(answer != guessed)
  if answer<guessed
    puts "Guess lower"
  else answer>guessed
    puts "Guess higher"
  end
  guessed = gets.to_i
end
puts "Bingo"
