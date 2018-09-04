function on_square(square)
    if 1 <= square <= 64
        2 ^ (square - 1)
    else
        throw(DomainError(":("))
    end
end

function total_after(square)
    if 1 <= square <= 64
        2 ^ square - 1
    else
        throw(DomainError(":("))
    end
end

