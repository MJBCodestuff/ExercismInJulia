import Statistics

function rationalize(successes, trials)
    [successes[i] // trials[i] for i in 1:length(successes)]
end

function probabilities(successes, trials)
    [float(x) for x in rationalize(successes, trials)]
end

function checkmean(successes, trials)
    if float(Statistics.mean(rationalize(successes, trials))) == Statistics.mean(probabilities(successes, trials))
        return true 
    else 
        return Statistics.mean(rationalize(successes, trials))
    end
end

function checkprob(successes, trials)
    if float(prod(rationalize(successes, trials))) == prod(probabilities(successes, trials))
        return true
    else
        return prod(rationalize(successes, trials))
    end
end
