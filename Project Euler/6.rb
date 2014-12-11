limit   = 100
sum     = limit * (limit+1)/2
sum_sq  = (2*limit + 1) * (limit + 1) * limit / 6
puts    sum**2 - sum_sq

=begin

sum squares equation:
f(n) = (n/6)(2n+1)(n+1)

sum equation
f(n) = n(n+1)/2
  
end