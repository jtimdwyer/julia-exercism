function cipher_dict()
    plain = "abcdefghijklmnopqrstuvwxyz"
    cipher = reverse(plain)
    Dict{Char, Char}(zip(cipher, plain))
end

function encode(input::AbstractString)
    message = decode(input)
    new_message = []
    for (index, char) in enumerate(message)
        if index % 5 == 0
            push!(new_message, char, ' ')
        else
            push!(new_message, char)
        end
    end
    rstrip(join(new_message))
end

function decode(input::AbstractString)
    cipher = cipher_dict()
    message = replace(lowercase(input), r"[^a-z0-9]" => "")
    join(get(cipher, c, c) for c in message)
end

