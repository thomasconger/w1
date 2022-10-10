def my_reject(arr, &prc)
    # iterate through array
        # for elements prc(ele) == false, shove into output array
    output = []
    arr.each {|ele| if prc.call(ele) == false then output << ele end}
    return output
end

def my_one?(arr, &prc)
    count = 0
    arr.each {|ele| if prc.call(ele) then count += 1 end }
    if count == 1 then true else false end
end

def hash_select(hash, &prc)
    output_hash = Hash.new()
    hash.each {|k,v| if prc.call(k, v) then output_hash[k] = v end }
    output_hash
end

def xor_select(arr, prc1, prc2)
    #iterate through arr
        #pass arr into prc1 and prc2
            #evaluate number, then fail if not 1
    output = []
    arr.each do |ele|
        if !(prc1.call(ele) && prc2.call(ele)) && !(!prc1.call(ele) && !(prc2.call(ele)))
             output << ele
        end
        end
    output
    #return arr containing only elements that result in true for 1 of prc1 and prc2
end

def proc_count(v , arr)
    count = 0
    arr.each {|prc| if prc.call(v) then count += 1 end}
    count
end
