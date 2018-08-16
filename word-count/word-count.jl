
#A helper funciton for stripping the tokens
notLetterOrNumber(x) = !isletter(x) && !isnumeric(x)


function processToken(token::SubString{String})
    #takes in a token from a split 
    #and returns a word with beginning and ending
    #punctuation removed i.e. quote marks at the 
    #beginning or end semi-colons and colons,
    #but should leave apostrophes for contractions
    #leaving being letters and numbers
    
    processedToken = rstrip(notLetterOrNumber, token)
    processedToken = lstrip(notLetterOrNumber, processedToken)
    
    #only return anything if the string isn't empty,
    #since the empty string isn't a word
    if processedToken != ""
        return processedToken
    end
end
  


function wordcount(sentence::AbstractString)
    
    wordDict = Dict{String, Int}()    
    sentence = lowercase(sentence)
    
    
    #run through the tokens, and the dictionary
    #will count them. use the seenWords set
    #to avoid key errors
    for token in split(sentence, r"[\s,.]")
        processedWord = processToken(token)
        if processedWord in keys(wordDict)
            wordDict[processedWord] += 1
        elseif processedWord != nothing
            wordDict[processedWord] = 1
        end
    end
    wordDict
end

