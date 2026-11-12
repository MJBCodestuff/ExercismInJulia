function all_15(ratings)
    length(ratings) == length(filter(x -> x == 1 || x == 5, ratings))
end

function emphatics(customers)
    filter(x -> all_15(x.second), customers)
end

function tobinary(ratings)
    map(x -> Int64(floor(x/5)), ratings)
end

function tobinarymatrix(ratings)
    transpose(reshape(mapreduce(tobinary, (x,y) -> cat(x,y,dims=1), ratings), (:, length(ratings))))
end
