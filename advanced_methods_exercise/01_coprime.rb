# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)

    #for the divisisors between 2 and min of [num1, num2], check if both num1 and num2 % divisor == 0, if so, return false
    (2..num_1).any? {|divisor| (num_1 % divisor == 0) && (num_2 % divisor == 0)}

end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
