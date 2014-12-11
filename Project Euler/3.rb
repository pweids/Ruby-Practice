s = Time.new
require 'prime'
arr = Prime.prime_division(600851475143).flatten
num = arr.sort.last
puts num
puts Time.new - s