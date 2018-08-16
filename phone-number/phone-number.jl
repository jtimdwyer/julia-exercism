function clean(phone_number)
    phone_num = join([x.match for x in eachmatch(r"[0-9]+", phone_number)])
    phone_num_len = length(phone_num)
    if (phone_num_len == 10
        && ('2' <= phone_num[1] <= '9')
        && ('2' <= phone_num[4] <= '9')
        )
        return phone_num
    elseif (phone_num_len == 11
            &&  ('2' <= phone_num[2] <= '9')
            && ('2' <= phone_num[5] <= '9')
            && (phone_num[1] == '1')
            )
        return phone_num[2:phone_num_len]
    end
end
