$count = 0

def mergesort(arr)
  n     = arr.size
  return arr if n <= 1
  n2    = n/2
  left  = arr[0...n2]
  right = arr[n2..-1]
  left  = mergesort(left)
  right = mergesort(right)
  merge(left, right)
end

def merge(left,right)
  ret = []
  lsize,rsize = left.size, right.size
  i,j = 0,0
  (lsize+rsize).times do
    if j == rsize
      ret.concat(left[i..-1])
      return ret
    elsif i == lsize
      ret.concat(right[j..-1])
      return ret
    end
    if left[i] < right[j]
      ret.push(left[i])
      i+=1
    else
      $count += lsize-i
      ret.push(right[j])
      j+=1
    end
  end
  ret
end

arr = Array.new(100_000)

File.open('IntegerArray.txt', 'r') do |fi|
  i = 0
  while line = fi.gets
    arr[i] = line.chomp.to_i
    i += 1
  end
end
mergesort(arr)

puts $count