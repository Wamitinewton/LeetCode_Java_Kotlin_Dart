class Solution {
 fun isValid(s: String): Boolean {
    val stack = Stack<Char>()

    val map = mapOf(
        '}' to '{',
        ')' to '(',
        ']' to '['
    )

    s.forEach {
        stack.push(it)

        if (map.containsKey(it)) {
            if (stack.size < 2) {
                return false
            }

            if (stack[stack.size - 2] != map[it]) {
                return false
            }

            stack.pop()
            stack.pop()
        }
    }

    return stack.isEmpty()
}
}
