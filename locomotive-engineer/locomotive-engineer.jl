function get_vector_of_wagons(args...)
    collect(args)
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    [each_wagons_id[3]; missing_wagons; each_wagons_id[4:length(each_wagons_id)]; each_wagons_id[1:2]]
end

function add_missing_stops(route, stops...)

end

function extend_route_information(route; more_route_information...)

end
