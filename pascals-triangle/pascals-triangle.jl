function nextrow(kRow::Array{Int})
    #returns the (k+1)th row of Pascal's triangle
    rowl, rowr = kRow[1:end-1], kRow[2:end]
    [1, (rowl + rowr)..., 1]
end

function triangle(n::Int)
    pascal = Array{}[]
    if n < 0
        throw(DomainError("Cannot be negative!"))
    elseif n > 0
        push!(pascal, [1])
        while length(pascal) < n
            push!(pascal, nextrow(pascal[end]))
        end
    end
    pascal
end