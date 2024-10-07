class Solution {
    fun maxProfit(prices: IntArray): Int {
        if (prices.isEmpty()) return 0
        var ret = 0
        var min = prices[0]
        for (i in 1 until prices.size) {
            min = Math.min(min, prices[i])
            ret = Math.max(prices[i] - min, ret)
        }
        return ret
    }
}
