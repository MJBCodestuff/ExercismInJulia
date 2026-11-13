function humiditycheck(pct_humidity)
   if pct_humidity > 70
    throw(ErrorException("humidity level check failed: $pct_humidity%"))
   else
    @info "humidity level check passed: $pct_humidity%"
   end
end

function temperaturecheck(temperature)
        if isnothing(temperature)
            throw(ArgumentError("sensor is broken"))
        end
        if temperature > 500
            throw(DomainError(temperature, "overheating detected"))
        end
        @info "temperature check passed: $temperature °C"
end

# define MachineError here
struct MachineError <: Exception
    msg::String 
end

function machinemonitor(pct_humidity, temperature)
    me = false
    try
        humiditycheck(pct_humidity)
    catch exception
        if exception isa ErrorException
            @error exception.msg
        else 
            rethrow()
        end
        me = true
    end
    try
        temperaturecheck(temperature)
    catch exception
        if exception isa ArgumentError
            @warn exception.msg
        elseif exception isa DomainError
            @error "$(exception.msg): $(exception.val) °C"
        else 
            rethrow()
        end
        me = true
    finally
        if me 
            throw(MachineError("An error occoured"))
        end
    end

end