def partition(arr, num)
    lesser = []
    eq_or_more = []
    arr.each do |ele|
        if ele < num
            lesser << ele
        else
            eq_or_more << ele
        end
    end
    return [lesser, eq_or_more]
end

def merge(hash1, hash2)
    output_hash = Hash.new {|k,v| output_hash[k] = 0}
    hash1.each {|k,v| output_hash[k] = v}
    hash2.each {|k,v| output_hash[k] = v}
    output_hash
end

def censor(sentence, forbidden_words)
    words = sentence.split()
    words.map do |word|
        if forbidden_words.include?(word.downcase)
            no_vowels(word)
        else
            word
        end
    end
    words.join(" ")
end

def no_vowels(word)
    word.each_char.with_index do |ltr, idx|
        if "aeiouAEIOU".include?(ltr)
            word[idx] = "*"
        end
    end
    word
end

def power_of_two?(num)
    (0...num).each {|power| return true if 2 ** power == num}
    return false
end
