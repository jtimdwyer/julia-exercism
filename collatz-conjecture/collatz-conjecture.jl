function collatz_steps(n::Int)
    if n <= 0
        throw(DomainError("Need a positive integer!"))
    end
    steps = 0
    while n > 1
        steps += 1
        if n % 2 == 0
            n /= 2
        else
            n = 3 * n + 1
        end
    end
    steps
end