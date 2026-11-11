# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end
# define the Plot keyword type
@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    return claim in register
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if is_claim_staked(claim, register)
        return false
    end
    push!(register, claim)
    return true
end

function get_longest_side(claim::Plot)
    return max((claim.top_right.x - claim.bottom_left.x), (claim.top_right.y - claim.bottom_left.y))
end

function get_claim_with_longest_side(register::Set{Plot})
    result = Set()
    max = 0
    for claim in register
        longestside = get_longest_side(claim)
        if longestside > max
            empty!(result)
            max = longestside
        end
        if longestside == max
            push!(result, claim)
        end
    end
    return result
        
end
