const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]

function frown!(E)
    E[7:9, 7:12] = 
        [
            0 0 1 1 0 0;
            0 1 0 0 1 0;
            1 0 0 0 0 1;
        ]
    return E
        
    
end

function frown(E)
    e2 = copy(E)
    return frown!(e2)
end

function stickerwall(E)
    return [E frown(E) ; ones(1, 36) ; frown(E) E]
end

function colpixelcount(E)
    e2 = copy(E)
    for col in eachcol(e2)
        newvalue = sum(col)
        replace!(x -> x == 1 ? newvalue : 0, col)
    end
    return e2
end

function render(E)
    result = ""
    for row in eachrow(E)
        result *= join([x == 0 ? " " : "X" for x in row])
        result *= "\n"
    end
    result = result[1:length(result ) - 1]
    return result    
end