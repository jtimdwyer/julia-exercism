function score(str::AbstractString)
    #If the string is empty, wel
    if isempty(str)
        return 0
    end
    #We'll create a dictionary with the scores
    #for each tile, then sum over all the characters
    #in str, and look up the scores in that dictionary
    letters = [
        ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
        ['D', 'G'],
        ['B', 'C', 'M', 'P'],
        ['F', 'H', 'V', 'W', 'Y'],
        ['K'],
        ['J', 'X'],
        ['Q', 'Z']
    ]
    values = [1, 2, 3, 4, 5, 8, 10]

    tileScores = Dict{Char, Int}()
    for (letterRow, score) in zip(letters, values)
        for letter in letterRow
            tileScores[letter] = score
        end
    end
#     return tileScores
    sum(get(tileScores, uppercase(char), 0) for char in str)
end

