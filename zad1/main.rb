def sort_letters(str)
  i=0
  while i<(str.length-1)
    j=0
    while j<(str.length-i-1)
      if str[j]>str[j+1]
        str[j],str[j+1]=str[j+1],str[j]
      end
      j+=1
    end
    i+=1
  end
  return str
end

def count_vowels(str)
  i=0
  amt=0
  while i<str.length
    case str[i]
    when 'a', 'e', 'i', 'o', 'u', 'y'
      amt+=1
    end
    i+=1
  end
  return amt
end

def filter_odd(t)
  i=0
  w = []
  for el in t
    if (el%2)==1
      w[i]=el
      i+=1
    end
  end
  return w
end