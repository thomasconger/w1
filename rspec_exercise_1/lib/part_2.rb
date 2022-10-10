def hipsterfy(word)
    vowels = "aeiou"
    locations = []
    #find location of last vowel
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            locations << idx
        end
    end
    #remove last vowel
    if locations == []
        return word
    else
        #word up to, but excluding, location of last vowel and everythign after
        return word[0...locations.max] + word[(locations.max+1)..-1]
    end
end

def vowel_counts(string)
    counts = Hash.new (0)
    vowels = "aeiouAEIOU"
    string = string.downcase
    #iterate through str, for each vowel increment hash key-value-pair
    string.each_char do |ltr|
        if vowels.include?(ltr)
            counts[ltr] += 1
        end
    end
    return counts
end

def caesar_cipher(str, n)
    str.each_char.with_index do |char, idx|
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        if alphabet.include?(char)
            position = (alphabet.index(char) + n) % 26
            str[idx] = alphabet[position]
        end
    end
    str
end

p caesar_cipher("apple", 1)
p caesar_cipher("apple", 2)
p caesar_cipher("hello", 5)
p caesar_cipher("zebra", 4)
p caesar_cipher("whoa", 26)
p caesar_cipher("whoa", 52)
