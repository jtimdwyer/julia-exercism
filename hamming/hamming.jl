function distance(s1::AbstractString, s2::AbstractString)
    if length(s1) != length(s2)
        throw(ArgumentError("These strands are not the same length"))
    else
        sum([char1 != char2 for (char1, char2) in zip(s1, s2)])
    end
end