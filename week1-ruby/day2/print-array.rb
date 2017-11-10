k = 0
arr16 = []
while k < 16
  k += 1
  arr16.push(k)
end

subarr = []
arr16.each do |v|
  subarr << v
  if subarr.length == 4
    p subarr
    subarr = []
  end
end
