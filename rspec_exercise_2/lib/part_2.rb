require "byebug"

def palindrome?(str)
    original = str
    reverse = ""
    str.each_char.with_index {|char,idx| reverse << str[str.length - 1 - idx]}
    original == reverse
end

def substrings(str)
    #nested loops to create all continuous possible combinations of continuous chars stored in an array
    # "jump" -> ["j", "u", "m", "p", "ju", "um" ... "jum", "ump"]
    # given length, will need length - X iterations
    # (1...length), (length - times)
    ss = []
    (0..str.length).each do |ss_length|
        # each char, shovel str[position..position+ss_length]
        str.each_char.with_index do |ltr, idx|
            if (idx + ss_length) < str.length
                ss << str[idx..(idx+ss_length)]
            end
        end
    end
    ss
end

def palindrome_substrings(str)
    ss = substrings(str)
    ss.each do |sub|
        if palindrome?(sub) == true && sub.length > 1
            ss << sub
        end
    end
end
