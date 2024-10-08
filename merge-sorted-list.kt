class Solution {
    fun mergeTwoLists(l1: ListNode?, l2: ListNode?): ListNode? {
        val result = ListNode(0)
        var current = result

        var node1 = l1
        var node2 = l2
        while (node1 != null || node2 != null) {
            if (node1 == null) {
                current.next = node2
                break
            }
            if (node2 == null) {
                current.next = node1
                break
            }

            if (node1.`val` < node2.`val`) {
                current.next = node1
                node1 = node1.next
            } else {
                current.next = node2
                node2 = node2.next
            }
            current = current.next!!
        }
        return result?.next
    }
}
