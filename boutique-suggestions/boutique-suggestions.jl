function clothingitem(categories, qualities)
    Dict(categories[i] => qualities[i] for i in eachindex(categories))
end

function get_combinations(tops, bottoms)
    [(t, b) for t in tops, b in bottoms]
end

function get_prices(combos)
    [t["price"] + b["price"] for (t, b) in combos]
end

function filter_clashing(combos)
    [(t, b) for (t, b) in combos if t["base_color"] != b["base_color"]]
end
