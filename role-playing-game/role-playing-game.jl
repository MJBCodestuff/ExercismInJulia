StringOrMissing = Union{String, Missing}

IntOrNothing = Union{Int64, Nothing}

@kwdef mutable struct Player
    name::StringOrMissing = missing
    level::Int64 = 0
    health::Int64 = 100
    mana::IntOrNothing = nothing
end

introduce(player::Player) = !ismissing(player.name) ? player.name : "Mighty Magician"

increment(mana::Nothing) = 50
increment(mana::Int64) = mana + 100
increment(name) = !ismissing(name) ? "$name the Great" : "The Great"

title!(player::Player) = player.level == 42 ? player.name = increment(player.name) : player.name

function revive!(player::Player)
    if player.health == 0
        player.health = 100
        player.mana = increment(player.mana)
    end
    return player
end
