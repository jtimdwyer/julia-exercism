function min_length(sides)
    minimum(sides) > 0
end

function is_nondegen(sides)
    a, b, c = sort(sides)
    (a + b >= c)
end

function is_equilateral(sides)
    is_nondegen(sides) && min_length(sides) && (length(Set(sides)) == 1)
end

function is_isosceles(sides)
    is_nondegen(sides) && min_length(sides) && (length(Set(sides)) <= 2)
end

function is_scalene(sides)
    is_nondegen(sides) && min_length(sides) && (length(Set(sides)) == 3)
end
