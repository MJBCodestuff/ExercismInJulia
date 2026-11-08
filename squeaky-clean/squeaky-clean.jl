function transform(ch)
    ch == '-' && return "_"
    isspace(ch) && return ""
    isuppercase(ch) && return "-$(lowercase(ch))"
    isnumeric(ch) && return ""
    ch in ['α' :'ω'] && return "?"
    return string(ch)
end

function clean(str)
    cleaned = [""]
    for ch in collect(str)
        push!(cleaned, transform(ch))
    end
    return join(cleaned)
end
