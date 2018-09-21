function binary(n::Int)
    if n == 0
        return "0"
    elseif n == 1
        return "1"
    else
        binary(floor(Int, n/2)) * string(n % 2)
    end
end

function secret_handshake(code::Int)
    operations = Dict{Int, String}(
        1 => "wink",
        2 => "double blink",
        3 => "close your eyes",
        4 => "jump",
    )

    reversals = Set([
        5,
        ])

    out = String[]
    reverse_output = false

    for (place, c) in enumerate(reverse(binary(code)))
        if c == '1'
            if place in keys(operations)
                push!(out, operations[place])

            end
        end

        if place in reversals
            reverse_output = (c == '1')
        end
    end

    if reverse_output
        out = reverse(out)
    end
    out
end
