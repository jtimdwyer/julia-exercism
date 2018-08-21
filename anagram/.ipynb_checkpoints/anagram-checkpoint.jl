function string_counter(subject::AbstractString)
    str_dict = Dict{Char, Int}()
    for char in collect(subject)
        if char in keys(str_dict)
            str_dict[char] += 1
        else
            str_dict[char] = 0
        end
    end
    str_dict
end

function detect_anagrams(subject::AbstractString, candidate::AbstractString)
    sub_lower, can_lower = lowercase(subject), lowercase(candidate)
    sub_lower != can_lower && (string_counter(sub_lower) == string_counter(can_lower))
end

function detect_anagrams(subject::AbstractString, candidates::AbstractArray)
    [c for c in candidates if detect_anagrams(subject, c)]
end
