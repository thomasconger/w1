def select_even_nums(arr)

    return arr.select{|ele| ele % 2 == 0}

end

def reject_puppies(arr)

    arr.reject {|puppy| puppy["age"] <= 2}

end

def count_positive_subarrays(arr)

    arr.count {|subarr|subarr.sum > 0}

end

def aba_translate(str)
    translation = ""
    str.each_char do |ltr|
        if "aeiou".include?(ltr)
            translation << ltr + "b" + ltr
        else
            translation << ltr
        end
    end
    translation
end

def aba_array(arr)
    translation = arr.map {|ele|aba_translate(ele)}
end
