function ispangram(input::AbstractString)
    input_letters = [lowercase(char) for char in input if isletter(char)]
    num_letters = length(
        Set(input_letters)
    )
    num_letters == 26
end