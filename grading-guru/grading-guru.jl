function demote(n)
    n isa Float64 && return UInt8(ceil(n))
    n isa Integer && return Int8(n)
    throw(MethodError(demote, (n,)))
end

function preprocess(coll)
    if coll isa Vector
        return coll .|> demote |> reverse
    end
    if coll isa Set
        return coll .|> demote |> collect |> (v -> sort(v, rev=true))
    end
    throw(MethodError(preprocess, (coll,)))
end
