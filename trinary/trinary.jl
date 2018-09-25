function trinary_to_decimal(str::AbstractString)
    output = 0
    chars = Set(['0', '1', '2'])
    for (place, c) in enumerate(reverse(str))
        if !(c in chars)
            return 0
        end
        output += parse(Int, c) * 3 ^ (place - 1)
    end
    output
end
