function encodeArrayUpdate(running_list::Array, char_counter::Int, prev_char::Char)
    #Updates the array 
    if char_counter <= 1
        char_counter = ""
    end
    push!(running_list, string(char_counter) * string(prev_char))
end

function encode(s::String)
    # In case the string is empty!
    if s == ""
        return ""
    end
    
    # If the string is not empty!
    running_list = String[]
    prev_char = s[1]
    char_counter = 0
    
    for cur_char in s
        #if we see the same character, just update the counter
        if cur_char == prev_char
            char_counter += 1
        else
        # if we see a new character, update the array, and reset the characters
        # and the counter itself
            encodeArrayUpdate(running_list, char_counter, prev_char)
            prev_char = cur_char
            char_counter = 1
        end
    end
    #need to do the final array update
    encodeArrayUpdate(running_list, char_counter, prev_char)
    join(running_list)
end

function decode(s::String)
    
    #We'll the processed array to store the processed strings that 
    #we'll end up joining to get the decoded string
    #and the tmpDigit array to store characters in a 
    #that will end up saying how many times a character should be repeated
    
    processed = String[]
    tmpDigit = Char[]
    
    
    #mySymbols and myDigits -- these are justs strings that have
    #either the digits or alphabetic characters replaces with spaces. 
    #this lets us, in a zipped for loop, check whether or not each new character
    #should correcposnd to a new entry in the processed list
    mySymbols = replace(s, r"[1-9]" => " ")
    myDigits = replace(s, r"[a-zA-Z]" => " ")

    
    for (s, d) in zip(mySymbols, myDigits)
        if d == ' '
            if length(tmpDigit) == 0
                add_string = string(s)
            else
                add_string = s ^ parse(Int, join(tmpDigit))
            tmpDigit = Char[]
            end
            push!(processed, add_string)
        else
            push!(tmpDigit, d)
        end
    end
    join(processed)
end

