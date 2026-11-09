function cleanupname(name)
    name |> (s -> replace(s, "-" => " ")) |> strip
end

function firstletter(name)
    name |> cleanupname |> first |> string
end

function initial(name)
    name |> firstletter |> uppercase |> (s -> s * ".")
end

function couple(name1, name2)
    "❤ $(name1 |> initial)  +  $(name2 |> initial) ❤"
end
