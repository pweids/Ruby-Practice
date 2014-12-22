require 'benchmark'

def karatsuba(x,y,debug = false)
  puts "x: #{x}, y: #{y}\n" if debug
  n = [x.to_s.size, y.to_s.size].max
  n2 = (n.to_f/2).ceil
  return x * y if n == 1

  a = x / 10**(n2)
  b = x - a * 10**(n2)
  c = y / 10**(n2)
  d = y - c * 10**(n2)
  ab = a+b
  cd = c+d

  puts "a: #{a}, b: #{b}, c: #{c}, d: #{d}, ab: #{a+b}, cd: #{c+d}\n\n" if debug


  ac = karatsuba(a,c)
  bd = karatsuba(b,d)
  adbc = karatsuba(ab,cd) - ac - bd

  (10**(2*n2))*ac + (10**n2)*(adbc) + bd
end

x = 2340957324752309475093275093280587432509873284240932849184098720974509743987234
y = 2384098243098571092837827309465081763298576213987465109876438751347561071238475

n = 500

Benchmark.bm do |z|
  z.report("karatsuba:") { n.times do ; karatsuba(x,y); end}

  z.report("times: ") {n.times do ; x*y; end}
end