require "byebug"

def factors(num) #get all factors of a num
    factors = []
    (2..num).each do |divisor|
        if num % divisor == 0
            factors << divisor
        end
    end
    factors
end


def prime_factors(factors) #return array of prime numbers
    only_primes = []
    factors.each do |num|
        if factors(num).length == 1
            only_primes << num
        else

        end
    end
    return only_primes
end

def largest_prime_factor(num)
    all_factors = factors(num)
    only_primes = prime_factors(all_factors)
    return only_primes.max
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char do |ltr|
        hash[ltr] += 1
    end

    if hash.values.any? {|ele| ele > 1}
        return false
    else
        return true
    end

end

def dupe_indices (array)
    hash = Hash.new {|h,k| h[k] = []}
    array.each_with_index do |ele, idx|
        hash[ele] << idx
    end
    hash.reject {|k,v| v.length < 2}
end

def ana_array(arr1, arr2)
    hash1 = Hash.new {|k,v| k[v] = 0}
    hash2 = Hash.new {|k,v| k[v] = 0}
    arr1.each do |ele|
        hash1[ele] += 1
    end
    arr2.each do |ele|
        hash2[ele] += 1
    end
    if hash1 == hash2
        return true
    else
        return false
    end
end

# debugger
# p ana_array(["i","c","e","m","a","n"], ["c","i","n","e","m","a"])
