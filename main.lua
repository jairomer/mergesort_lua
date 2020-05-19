#!/usr/bin/lua 

-- Testing script. 
random_array = {}
math.random(os.clock()*10000)
io.write("Original: ")
for i=1,10 do
	random_array[i] = math.floor(math.random()*201 - 101)
	io.write(random_array[i].." ")
end
print()

sort = require("mergesort")
sort.mergesort(random_array, 1, 10)

io.write("Sorted: ")
for i=1, #random_array do
	io.write(random_array[i].." ")
end
print()

