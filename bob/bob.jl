function bob(stimulus::AbstractString)
    stimulus = strip(stimulus)
    if stimulus == ""
        return "Fine. Be that way!"
    elseif occursin(r"[a-zA-Z]", stimulus) && uppercase(stimulus) == stimulus
        return "Whao, chill out!"
    elseif endswith(stimulus, "?")
        return "Sure."
    else
        return "Whatever."
    end
end
