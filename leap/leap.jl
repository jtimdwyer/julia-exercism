function is_leap_year(year::Int)
    div_4 = (year % 4 == 0)
    div_100 = (year % 100 == 0)
    div_400 = (year % 400 == 0)
    (div_4 && !div_100) || div_400
end
