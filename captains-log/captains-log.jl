using Random

function random_planet()
    rand(['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y'])
end

function random_ship_registry_number()
    regNr = rand(1000:9999)
    "NCC-$regNr"
end

function random_stardate()
    rand(41000.0:42000.0)
end

function random_stardate_v2()
    rand(41000:0.1:42000)
end

function pick_starships(starships, number_needed)
    shuffledships = shuffle(starships)
    [shuffledships[i] for i in 1:number_needed]
end
