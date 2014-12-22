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
      ret.push(right[j])
      j+=1
    end
  end
  ret
end

ainput  = [9,5,4,1,8,7,2,6,3,1,123,42,4,3,212,6,14,4,2123,6,7,5,78,4,24,25]

input = "come to the dark side, luke".split
test = mergesort(input)

print input, "\n ==> \n", test
