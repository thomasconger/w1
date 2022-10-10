def element_count(arr)
    hash = Hash.new {|k,v| 0}
    arr.each do |ele|
        hash[ele] += 1
    end
    hash
end

def char_replace!(str, hash)
    #iterate through str with index
        #for each char, check hash
            #if key => value pair found, replace str[i] with hash[char]
    #return original string
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char) then str[idx] = hash[char] end
    end
    str
end

def product_inject(arr)
    #iterate through elements of arr
        #multiply each element by product of all existing elements (assume product of first element is simply itself)
    arr.inject {|acc, el| acc * el}
end
