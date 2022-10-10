def proper_factors(n)
    # for range (1...n), test n % i. if true, shove into return array
    (1...n).select {|i| n % i == 0}
    # return all positive number sless than argument that are factors
end

def aliquot_sum(n)
    proper_factors(n).sum
    # return sum of all proper factors of num
end

def perfect_number?(n)
    #when number equals aliquot_sum, true
    #otherwise false
    if aliquot_sum(n) == n then true else false end
end

def ideal_numbers(n)
    output = []
    i = 1
    while output.length < n
        if perfect_number?(i) then output << i end
        i += 1
    end
    output
    # return arr continaing set of perfect numbers of length n
end
