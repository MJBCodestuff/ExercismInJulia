function print_name_badge(id, name, department)
    "$(!ismissing(id) ? "[$id] - " : "")$name - $(!isnothing(department) ? "$(uppercase(department))" : "OWNER")"
end

function salaries_no_id(ids, salaries)
    sum([salaries[i] for i in 1:length(ids) if ismissing(ids[i])], init=0)
end
