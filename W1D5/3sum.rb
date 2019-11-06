def three_sum(nums)
    ans = []
    return [] if nums.length < 3
    nums.sort!
    nums.each_with_index do |num, idx|
        break if num > 0
        #Method two_sum --> 2 numbers that sum to the num will give 0
        cut_arr = nums[idx+1..-1]
        p cut_arr
        two_sum(cut_arr, -num).each do |pairs|
            ans << [num, *pairs ].sort
        end
        
    end
    ans.uniq
end

def two_sum(arr, n)
    unique_pairs = []
    arr.each_with_index do |num, idx|
        if !arr.index(n-num).nil?
            i = arr.index(n-num)
            if idx != i
                unique_pairs << [num, arr[i]]
            end
        end
    end
    unique_pairs
end
#p two_sum([0,1,2,-1,-4], 1)
# p three_sum([-1,0,1,2,-1,-4])
p three_sum([1,0,-1])