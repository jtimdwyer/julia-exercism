function to_roman(number::Integer)
    if number <= 0
        throw(ErrorException("Must be a positive number!"))
    end
    numerals = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I"),
    ]

    roman = ""

    while number > 0
        for (k, v) in numerals
            while number >= k
                roman = roman * v
                number -= k
            end
        end
    end
    roman
end
