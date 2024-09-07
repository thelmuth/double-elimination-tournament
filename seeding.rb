
# This might be useful for making matchups: https://medium.com/@EthanRBrown/generating-a-direct-elimination-de-table-for-a-sporting-event-in-linear-time-2f50bbfa26d9


def ruler(n)
    if n % 2 == 0
        return 0
    end
    1 + ruler(n / 2)
end

p (1..30).map {|z| ruler z}
