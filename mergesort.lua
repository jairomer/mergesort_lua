#!/usr/bin/lua

-- Module Mergesort.
--   Mergesort is a comparison based sorting algorithm that uses a divide and conquer algorithm. 
sort = {}

function printCollection(collection) 
	for i=1, #collection do
		io.write(collection[i]..", ")
	end
	print()
end

-- Append the first and second collection to the third. 
function sort.merge (collection, low, mid, high)
	--printCollection(collection)
	--print("li: "..low, "mi: "..mid, "hi: "..high)
	local li = low
	local m = mid
	local hi = high
	assert(li <= m and li <= hi)
	assert(hi <= #collection)
	local l1 = m - li + 1 
	local l2 = hi - m 
	-- Initialize temporal arrays with the first and second part values. 
	local c1 = {}
	local c2 = {}
	for i=1, l1 do
		c1[i] = collection[li + i - 1] 
	end
	for j=1, l2 do
		c2[j] = collection[m + j] 
	end
	-- Merge the values of the temporal array back into the main collection.
	-- This is where the magic happens. 
	local i1 = 1 -- Initial index for first subarray. 
	local i2 = 1 -- Initial index for second subarray. 
	local ir = li -- Initial index for merged subarray.
	while (i1 <= #c1 and i2 <= #c2) do
		if c1[i1] <= c2[i2] then
			-- Put the smaller one first on the merged subarray. 
			collection[ir] = c1[i1]
			i1 = i1 + 1
		else
			collection[ir] = c2[i2]
			i2 = i2 + 1
		end
		ir = ir + 1
	end

	-- Copy the remaining elements of c1 if any. 
	while i1 <= #c1 do
		collection[ir] = c1[i1]
		i1 = i1 + 1
		ir = ir + 1
	end
	-- Copy the remaining elements of c2 if any. 
	while i2 <= #c2 do
		collection[ir] = c2[i2]
		i2 = i2 + 1
		ir = ir + 1
	end
	--printCollection(collection)
end

function sort.mergesort(collection, lowi, highi)
	if highi > lowi then
		-- Find the middle point to divide the array into two halves.
		local mid = math.floor((lowi+highi)/2)
		-- Call mergesort for the first half. 
		sort.mergesort(collection, lowi, mid)
		-- Call mergesort for the second half.
		sort.mergesort(collection, mid+1, highi)
		-- Merge the two halves sorted in step 2 and 3
		sort.merge(collection, lowi, mid, highi)
	end
end

return sort
