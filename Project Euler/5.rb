n = 232792560
loop do
  bool = true
  (1..20).each do |i|
    if n % i != 0
      bool = false
      break
    end
  end
  if bool == false
    n += 1
  else break
  end
  puts "passed" if n > 232792560
end

puts n