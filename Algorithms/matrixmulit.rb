require 'matrix'
require 'benchmark'
=begin
class Matrix2 < Array

  def initialize(n)
    createRandomMatrix(n)
  end

  def createRandomMatrix(n)
    matrix = Array.new(n)
    n.times do |i|
      row = Array.new(n)
      n.times do |j|
        row[j-1] = Random.rand(99)
      end
      self.push row
    end
  end

  def inspect
    ret = ""
    self.each do |arr|
      line = "|"
      arr.each_with_index do |arr2, i|
        char = arr2.to_s
        line += char.rjust(3-char.length, ' ')
        line += ", " if i < (arr.length-1)
      end
      ret += line + "|\n"
    end
    ret
  end

  def * (matrix)
    return -1 if matrix.length != self.length
    n = matrix.length
    n2 = n/2
    a = self[0...n][0...n]
    b = self[0...n][n..-1]
    c = self[n..-1][0...n]
    d = self[n..-1][n..-1]
    e 
    f 
    g 
    h
  end
end
=end

def pow2(n)
  return n & (n-1) == 0
end


def combine4(m1,m2,m3,m4)
  left = m1.to_a + m3.to_a
  right = m2.to_a + m4.to_a
  #p m1, m2, m3, m4
  #p "Left: ", left, " Right: ", right
  left.size.times do |i|
    left[i-1].concat right[i-1]
  end
  Matrix.rows(left)
end

def strassen(m1,m2)
  flag = false
  if (m1.row_count != m2.row_count) || (!m1.square? || !m2.square?)
    p "bad"
    return -1
  end
  n = m1.row_count


  return Matrix.build(1){m1[0,0] * m2[0,0]} if n == 1

  n2 = n/2

  a = m1.minor(0...n2, 0...n2)
  b = m1.minor(0...n2, n2..-1)
  c = m1.minor(n2..-1, 0...n2)
  d = m1.minor(n2..-1, n2..-1)

  e = m2.minor(0...n2, 0...n2)
  f = m2.minor(0...n2, n2..-1)
  g = m2.minor(n2..-1, 0...n2)
  h = m2.minor(n2..-1, n2..-1)

  p1 = strassen(a,f-h)
  p2 = strassen(a+b,h)
  p3 = strassen(c+d,e)
  p4 = strassen(d,g-e)
  p5 = strassen(a+d, e+h)
  p6 = strassen(b-d,g+h)
  p7 = strassen(a-c, e+f)

  return combine4(p5+p4-p2+p6, p1+p2, p3+p4, p1+p5-p3-p7)

end

m1 = Matrix.build(64){rand(10)}
m2 = Matrix.build(64){rand(10)}
puts Benchmark.measure{strassen(m1,m2)}
puts Benchmark.measure{ m1 * m2 }