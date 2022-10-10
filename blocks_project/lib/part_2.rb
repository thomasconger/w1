require "byebug"

def all_words_capitalized?(arr)
    arr.all? {|word| word == word[0].upcase + word[1..-1].downcase}
end

def no_valid_url?(arr)

    return true if arr.none?{|url| url.split(".")[1] == ("com" || "io" || "net" || "org")}
    return false

end

def any_passing_students?(arr)
    arr.any? {|student|(student[:grades].sum / student[:grades].length) >= 75 }
end
