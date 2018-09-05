function luhn(input::AbstractString)
    input = collect(replace(input, r"\s" => ""))
    is_valid = false

    if all(map(isdigit, input)) && length(input) >= 2
        input = map(x -> parse(Int, x), input)
        for (i,x) in enumerate(input[1:2:end])
            x *= 2
            if x > 10
                x -= 9
            end
            input[2*i-1] = x
        end
        is_valid = sum(input) % 10 == 0
    end
    is_valid
end
