str1 = "erbottlewat"
str2 = "waterbottle"

def uniquify(str)
  chars = {}
  str.each_char.each_with_index do |c,i|
    return false if str[i+1..-1].include? c
  end 
  return true
end

def permutation(str1, str2)
  return str1.chars.sort.join == str2.chars.sort.join
end

def isRotation(str1, str2)
  if str1.size != str2.size
    return false
  end
  strcheck = str1 + str1
  return strcheck.include? str2
end

puts isRotation(str1,str2)