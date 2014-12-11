num = 100

def palindrome(str)
  return str == str.reverse
end

largest = 0

s = Time.now
(999..900).each do |n1|
  (999..n1).each do |n2|
    check = n1*n2
    if palindrome check.to_s
      if check > largest
        largest = check
      else break
      end
    end
  end
end

puts largest
puts "elapsed: #{Time.now - s}"