function cipher_dict(key::Int)
    plain = "abcdefghijklmnopqrstuvwxyz"
    cipher = plain[key+1:end] * plain[1:key]

    plain = plain * uppercase(plain)
    cipher = cipher * uppercase(cipher)
    encode_dict = Dict{Char, Char}(zip(plain, cipher))
end

function rotate(key::Int, message::Char)
    encode_dict = cipher_dict(key)
    get(encode_dict, message, message)
end

function rotate(key::Int, message::String)
    encode_dict = cipher_dict(key)
    join([get(encode_dict, c, c) for c in message])
end

#defines the macros
for i in 1:26
    name = Symbol("R"*"$i"*"_str")
    @eval macro $name(x)
        rotate($i, x)
    end
end