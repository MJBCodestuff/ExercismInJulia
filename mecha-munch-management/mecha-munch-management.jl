function additems!(cart, items)
    for item in items
        cart[item] = get(cart, item, 0) + 1
    end
    return cart
end

function update_recipes!(ideas, updates)
    merge!(ideas, updates)
end

function send_to_store(cart, aislecodes)
    sort([(get(aislecodes, key, -1) => get(cart, key, -1)) for key in keys(cart)])
end

function update_store_inventory!(inventory, cart)
    mergewith!(-, inventory, cart)
    return Dict((key => 0) for key in keys(inventory) if get(inventory, key, -1) == 0)
end

function reorder!(outofstock, stock)
    for key in keys(outofstock)
        outofstock[key] = get(stock, key, 100)
    end
    return outofstock
end
