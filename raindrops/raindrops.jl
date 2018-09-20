function raindrops(number::Int)
    match = [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong")
    ]
    message = join([v for (k,v) in match if number % k == 0])
    if message == ""
        message = string(number)
    end
    message
end