def average(num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
    return 1.0 * arr.sum / arr.length
end

def repeat(str, num)
    return str * num
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(sentence)
    #alternate word case by
        #splitting str to arr
        #upcase or downcase
    #join
    words = sentence.split(" ")
    words.each_with_index do |word, idx|
        if idx.even?
            words[idx] = word.upcase
        else
            words[idx] = word.downcase
        end
    end
    words.join(" ")
end
