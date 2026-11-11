import Dates
function schedule_appointment(appointment::String)
    usformat = Dates.DateFormat("m/d/y H:M:S")
    return Dates.DateTime(appointment, usformat)
end

function has_passed(appointment::DateTime)
    return appointment < Dates.now()
end

function is_afternoon_appointment(appointment::DateTime)
    return Dates.Hour(12) <= Dates.Hour(appointment) < Dates.Hour(18)
end

function describe(appointment::DateTime)
    return "You have an appointment on $(Dates.format(appointment, Dates.DateFormat("E, U d, yyyy at HH:MM")))"
end

function anniversary_date()
    return Dates.Date(year(Dates.now()), 9, 15)
end
