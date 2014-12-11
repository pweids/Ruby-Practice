sum = 0
n1 = 1
n2 = 1
loop do
  n3 = n1 + n2
  break if n3 >= 4_000_000
  sum += n3 if n3 %2 == 0
  puts "#{n3} (#{sum})"
  n1 = n2
  n2 = n3
end

puts sum