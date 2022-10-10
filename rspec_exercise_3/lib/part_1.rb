# def is_prime?(num)
#     num < 2 ? false : (2...num).none? {|divisor| num % divisor ==0}
# end
require "byebug"

def is_prime?(num)
    return false if num < 2
    (2...num).none? {|divisor| num % divisor == 0}
end

def nth_prime(num)
    #find prime numbers until you have num prime numbers
    primes = []
    i = 0
    while primes.length < num
        if is_prime?(i) then primes << i end
        i += 1
    end

    primes[num - 1]
end

def prime_range(min,max)
    (min..max).select {|num| is_prime?(num)}
end
