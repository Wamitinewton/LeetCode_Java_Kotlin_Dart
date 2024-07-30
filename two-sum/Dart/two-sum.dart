void main(){
  Solution sol = Solution();
   List<int> nums = [2, 7, 11, 15]; // Example initialization
  int target = 9; // Example target value  
  List<int> result = sol.twoSum(nums, target);
  print(result);
}

class Solution {
    List<int> twoSum(List<int> nums, int target){
        Map<int, int> numMap = {};
        for(int i = 0; i < nums.length; i++){
            int complement = target - nums[i];
            if(numMap.containsKey(complement)){
                return [numMap[complement]!, i];
            }
            numMap[nums[i]] = i;
        }
        return [];
    }
}