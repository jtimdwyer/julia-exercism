function transform(input::Dict)
    output = Dict{Char, Int}()
    for (score, letterArray) in input
        for char in letterArray
            output[lowercase(char)] = score
        end
    end
    output
end
