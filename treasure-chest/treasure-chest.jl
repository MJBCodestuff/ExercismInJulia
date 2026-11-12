# define the TreasureChest{T} type
struct TreasureChest{T}
    password::String
    treasure::T
end

function get_treasure(password_attempt, chest)
    password_attempt == chest.password ? chest.treasure : nothing
end

function multiply_treasure(multiplier, chest)
    return TreasureChest{Vector{String}}(chest.password, repeat([chest.treasure], multiplier))
end
