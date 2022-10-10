# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    #iterate through str
    #count the consecutive chars
        # if next is repeat, add to count of identical chars
        # add num to prefix

    arr = str.split("") #convert str to arr to get methods
    output = Array.new()

    while arr != []
        ltr = arr.shift
        count = 1
        while ltr == arr[0]
            arr.shift
            count += 1
        end

        if count == 1
            output << ltr
        else
            output << count
            output << ltr
        end

    end

    output.join

    # while the array isn't empty
        # compare first string to second string
        # if they are the same
            # LOOP TO WRITE
        # if they are not the same,




end



p compress_str("aaabbc")        # => "3a2bc"
 p compress_str("xxyyyyzz")      # => "2x4y2z"
 p compress_str("qqqqq")         # => "5q"
 p compress_str("mississippi")   # => "mi2si2si2pi"
