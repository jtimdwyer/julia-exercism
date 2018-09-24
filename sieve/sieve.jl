function sieve(limit::Integer)
    iscomposite = [false for _ in 1:limit]
    for n in 2:limit
        i = n
        while i + n <= limit
            i += n
            iscomposite[i] = true
        end
    end
    [i for i in 2:limit if !iscomposite[i]]
end
