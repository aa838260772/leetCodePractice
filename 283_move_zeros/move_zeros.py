# -*- coding: utf-8 -*-
# @Author: aa838260772
# @Date:   2016-08-20 23:46:49
# @Last Modified by:   aa838260772
# @Last Modified time: 2016-08-21 00:15:53

class Solution(object):
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: void Do not return anything, modify nums in-place instead.
        """
        begin=0
        end=len(nums)-1
        while (begin < end):
        	while ( begin < end and nums[begin]!=0) :
        		begin += 1;
        	while ( begin< end and nums[end] == 0) :
        		end -= 1;
        	if(begin < end and nums[begin] == 0 and nums[end] != 0) :
        		nums[begin] = nums[begin] + nums[end]
        		nums[end]   = nums[begin] - nums[end]
        		nums[begin] = nums[begin] - nums[end]
        		begin += 1
        		end -= 1
        return nums;

    def WisemoveZeros(self, nums):
        """
        :type nums: List[int]
        :rtype: void Do not return anything, modify nums in-place instead.
        """
        begin = 0
        while (begin < len(nums) - 1) :
        	if(nums[begin] == 0) :
        		next_index = begin + 1;
        		while(next_index < len(nums) and nums[next_index] == 0) : #find first to swap
        			next_index += 1;
        		if (next_index < len(nums) and nums[next_index] != 0) :
        			nums[begin] = nums[begin] + nums[next_index]
        			nums[next_index]   = nums[begin] - nums[next_index]
        			nums[begin] = nums[begin] - nums[next_index]
        	begin += 1

if __name__ == '__main__':
	solution = Solution()
	list1 = [0,0,1,23,4,10,0,2,0,12,0]
	print list1
	solution.WisemoveZeros(list1)
	print list1