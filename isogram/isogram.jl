function isisogram(s::AbstractString)
    memory = Set{Char}()
    for char in s
        char_lower = lowercase(char)
        if char_lower in memory
            return false
        elseif match(r"[^-\s]", string(char_lower)) != nothing
            push!(memory, char_lower)
        end
    end
    true
end