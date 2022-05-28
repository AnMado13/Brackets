import Foundation

struct BracketsStack {
    private var items: [Character] = []
    private var positions: [Int] = []

    func count() -> Int {
        return items.count
    }

    mutating func push(item: Character, position: Int){
        items.append(item)
        positions.append(position)
    }

    mutating func pop() -> (Character, Int) {
        return (items.removeLast(), positions.removeLast())
    }
}

func checkBrackets(string: String) -> Int{
    let opening: [Character: Character] = ["{": "0", "[": "1", "(": "2"]
    let closing: [Character: Character] = ["}": "0", "]": "1", ")": "2"]
    var stack: BracketsStack = BracketsStack()

    for (index, character) in string.enumerated() {
        if (closing.keys.contains(character)) {
            if (stack.count() == 0) || (opening[(stack.pop()).0] != closing[character]) {
                return (index + 1)
            }
        }
        else if (opening.keys.contains(character)) {
            stack.push(item: character, position: index + 1)
        }
    }

    if stack.count() != 0 {
        return (stack.pop()).1
    }

    return -1
}
