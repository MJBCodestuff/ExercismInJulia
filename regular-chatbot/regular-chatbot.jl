function is_valid_command(msg)
    occursin(r"^chatbot"i, msg)
end

remove_emoji(msg) = replace(msg, r"emoji\d*" => "")

function check_phone_number(number)
    occursin(r"^\(\+\d{2}\) \d{3}-\d{3}-\d{3}$", number) ? "Thanks! You can now download me to your phone." : "Oops, it seems like I can't reach out to $number"
end

function getURL(msg)
    (m -> m.match).(eachmatch(r"\w*\.\w*", msg))
end

function nice_to_meet_you(str)
    name = replace(str, r"(\w+), (\w+)" => s"\2 \1")
    return "Nice to meet you, $name"

end
