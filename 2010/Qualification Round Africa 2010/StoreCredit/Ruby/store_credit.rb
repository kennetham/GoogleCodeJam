#!/bin/env ruby

test_case = gets.chomp

for i in 0...test_case.to_i
  store_credit = gets.chomp
  n_items = gets.chomp
  l_item = gets.chomp

  item = l_item.split
  item_index = Array.new
  is_found = false

  item.permutation(2) { |a, b|
    if (a.to_i + b.to_i == store_credit.to_i && is_found == false)
      item_index.push(item.index("#{a.to_i}") + 1, item.index("#{b.to_i}") + 1)
      is_found = true
    elsif (is_found == true)
      if (item_index[0] > item.index("#{a.to_i}") + 1)
        item_index.clear
        item_index.push(item.index("#{a.to_i}") + 1, item.index("#{b.to_i}") + 1)
      end
    end
  }

  puts "Case ##{i += 1}: " + item_index.to_a.join(" ").to_s
end