sum = 0
3.upto(999) do |n|
  sum += n if n % 3 == 0 || n % 5 == 0
end

puts sum