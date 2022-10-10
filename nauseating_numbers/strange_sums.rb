require "byebug"
# Write a method strange_sums that accepts an array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.

def strange_sums(arr)
    #count pairs with a sum of zero
    count = 0
    while arr != []
        test = arr.pop
        arr.each do |ele|
            if test + ele == 0
                count += 1
            end
        end
    end
    count
end

#pair_product
#Write a method pair_product that accepts an array of numbers and a product as arguments. The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. You may assume that the input array contains unique elements.

def pair_product(arr, product)
    arr.each do |first_num|
        arr.each do |second_num|
            return true if first_num * second_num == product && first_num != second_num
        end
    end
    false
end

#rampant_repeats
#Write a method rampant_repeats that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are repeated the number of times specified by the hash. If a character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
    #if char in hash, insert number of times from key
    #if char not in hash, don't
    #return new string
    rep_str = ""
    str.each_char do |ltr|
        if hash.has_key?(ltr)
            rep_str << (ltr * hash[ltr])
        else
            rep_str << ltr
        end
    end
    return rep_str
end

#perfect_square?
#Write a method perfect_square? that accepts a number as an argument. The method should return a boolean indicating whether or not the argument is a perfect square. A perfect square is a number that is the product of some number multiplied by itself. For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square?(num)
    (1..num).each do |factor|
        return true if factor ** 2 == num
    end
    false
end

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The method should return true if the given number has more divisors than all positive numbers less than the given number. For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

def anti_prime?(num)
    #"highly composite numbers"
    test = divisors(num).length
    (1..num).each do |lower_nums|
        if divisors(lower_nums).length > test
            return false
        end
    end
    true
    #return true or false
end

def divisors(num)
    #prob 1: find number of divisors of num
    divisors = []
    (1..num).each do |div|
        divisors << div if num % div == 0
    end
    divisors
end

#matrix_addition
#Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments. The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments. To add matrices, we simply add the values at the same positions:

# programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# structurally
#2 5  +  9 1  =>  11 6
#4 7     3 0      7 7

def matrix_addition(ma, mb)
    #create output_matrix with identical lengths
    #iterate through nested arrays, performing operations to get output_matrix
    #return matrix c
    rows = ma.length
    cols = ma[0].length

    output_matrix = Array.new(rows) {Array.new(cols)}

    output_matrix.each_with_index do |ele1, row|
        output_matrix.each_with_index do |ele2, col|
            if ma[row][col] != nil
                output_matrix[row][col] = ma[row][col] + mb[row][col]
            end
        end
    end
    output_matrix
end


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

#p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
#p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
#p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
#p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

#mutual_factors
#Write a method mutual_factors that accepts any amount of numbers as arguments. The method should return an array containing all of the common divisors shared among the arguments. For example, the common divisors of 50 and 30 are [1, 2, 5, 10]. You can assume that all of the arguments are positive integers.

def mutual_factors(*arr)
    mutual_factors = []
    all_factors = Array.new(arr.length) {Array.new}
    arr.each_with_index do |num, idx|
        all_factors[idx] << divisors(num)
    end
    all_factors.flatten.uniq.each_with_index do |factor, idx|
        if arr.all? {|num| num % factor == 0}
            mutual_factors << factor
        end
    end
    mutual_factors
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
#  p mutual_factors(50, 30, 45, 105)   # [1, 5]
#  p mutual_factors(8, 4)              # [1, 2, 4]
#  p mutual_factors(8, 4, 10)          # [1, 2]
#  p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
#  p mutual_factors(12, 24, 64)        # [1, 2, 4]
#  p mutual_factors(22, 44)            # [1, 2, 11, 22]
#  p mutual_factors(22, 44, 11)        # [1, 11]
#  p mutual_factors(7)                 # [1, 7]
#  p mutual_factors(7, 9)              # [1]

#tribonacci_number
#The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2. To generate the next number of the sequence, we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:

#1, 1, 2, 4, 7, 13, ... and so on
#Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.

def tribonacci_number(n)
    trib = [1,1,2]
    if n > 3
        #generate tribonaci up to trib.length(n-1)
        while trib.length < n
            trib << (trib[-1] + trib[-2] + trib[-3])
        end
    end
    output = trib[-1]
    return output
end

# # p tribonacci_number(1)  # 1
# # p tribonacci_number(2)  # 1
# # p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*arr)
    m_rows = arr[0].length
    m_cols = arr[0][0].length
    arr.each_with_index do |ele, idx|
        if m_rows != arr[idx].length || m_cols != arr[idx][0].length
            return nil
        end
    end

    output = arr.inject do |acc, ele|
        matrix_addition(acc,ele)
    end
    return output
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# squarocol?
# Write a method squarocol? that accepts a 2-dimensional array as an argument. The method should return a boolean indicating whether or not any row or column is completely filled with the same element. You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

# Examples

def squarocol?(grid)
    #check if rows filled with same elements
        #row0 col0  & row0 col1 & row0 col3
        #

    # check if row is same
    grid.each_with_index do |sub, idx|
        if grid[idx].uniq.length == 1
            return true
        end
    end
    #check if cols filled with same elements
    grid.transpose.each_with_index do |sub, idx|
        if grid[idx].uniq.length == 1
            return true
        end
    end
    # default
    return false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false
