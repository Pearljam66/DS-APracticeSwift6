//
//  InsertDeleteGetRandom0(1)Test.swift
//  DS&A PracticeTests
//
//  Created by Sarah Clark on 10/9/24.
//

/*
 Implement the RandomizedSet class:
 RandomizedSet() Initializes the RandomizedSet object.
 bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
 bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
 int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
 You must implement the functions of the class such that each function works in average O(1) time complexity.

 Example 1:
 Input
 ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
 [[], [1], [2], [2], [], [1], [2], []]
 Output
 [null, true, false, true, 2, true, false, 2]

 Explanation
 RandomizedSet randomizedSet = new RandomizedSet();
 randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
 randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
 randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
 randomizedSet.insert(2); // 2 was already in the set, so return false.
 randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.

 Constraints:

 -231 <= val <= 231 - 1
 At most 2 * 105 calls will be made to insert, remove, and getRandom.
 There will be at least one element in the data structure when getRandom is called.
 */

// TODO: Need to fix
/*import Testing

 final class InsertDeleteGetRandom0_1_Test {

 class RandomizedSet {
 // Dictionary for O(1) access to the index of elements
 var dict: [Int: Int]
 // Array to store the actual values for O(1) random access
 var list: [Int]
 // To generate random numbers
 private var random = SystemRandomNumberGenerator()

 init() {
 dict = [:]
 list = []
 }

 func insert(_ val: Int) -> Bool {
 if dict[val] != nil {
 return false
 }
 dict[val] = list.count
 list.append(val)
 return true
 }

 func remove(_ val: Int) -> Bool {
 guard let index = dict[val] else {
 return false
 }
 // Move the last element to the place of the element to be removed
 let lastElement = list.last!
 list[index] = lastElement
 dict[lastElement] = index
 // Remove the last element and the dictionary entry
 list.removeLast()
 dict[val] = nil

 // If we've removed the last item and the list is now empty, dict should be cleared to avoid confusion
 if list.isEmpty {
 dict.removeAll()
 }
 return true
 }

 func getRandom() -> Int {
 print("Entering getRandom")
 guard !list.isEmpty else {
 fatalError("Cannot get a random element from an empty set.")
 }
 let index = Int(random.next()) % list.count
 print("Random index generated: \(index), list count: \(list.count)")
 return list[index]
 }
 }

 /**
  * Your RandomizedSet object will be instantiated and called as such:
  * let obj = RandomizedSet()
  * let ret_1: Bool = obj.insert(val)
  * let ret_2: Bool = obj.remove(val)
  * let ret_3: Int = obj.getRandom()
  */

 var randomizedSet: RandomizedSet!

 init() async throws {
 randomizedSet = RandomizedSet()
 }

 deinit {
 randomizedSet = nil
 }

 @Test func testInsertion() {
 #expect(randomizedSet.insert(1) == true)
 #expect(randomizedSet.insert(1) == false)  // Should return false as 1 is already inserted
 #expect(randomizedSet.insert(2) == true)
 }

 @Test func testRemoval() {
 randomizedSet.insert(1)
 randomizedSet.insert(2)

 #expect(randomizedSet.remove(3) == false)  // Should return false as 3 does not exist
 #expect(randomizedSet.remove(1) == true)
 #expect(randomizedSet.remove(1) == false)  // Should return false as 1 has been removed
 }

 @Test func testGetRandom() {
 // Since getRandom() can return any element, we'll just test if it returns something
 // that should be in the set after insertions.
 randomizedSet.insert(10)
 randomizedSet.insert(20)
 randomizedSet.insert(30)

 let randomValue = randomizedSet.getRandom()
 #expect([10, 20, 30].contains(randomValue) == true)

 // Test with only one element
 while randomizedSet.list.count > 1 {
 _ = randomizedSet.remove(randomizedSet.list[0])
 }
 #expect(randomizedSet.getRandom() == randomizedSet.list[0])
 }

 @Test func testComplexScenario() {
 #expect(randomizedSet.insert(0) == true)
 #expect(randomizedSet.insert(1) == true)
 #expect(randomizedSet.remove(0) == true)
 #expect(randomizedSet.insert(2) == true)
 #expect(randomizedSet.remove(1) == true)
 #expect(randomizedSet.getRandom() == 2)
 }

 @Test func testInsertAfterRemove() {
 #expect(randomizedSet.insert(1) == true)
 #expect(randomizedSet.remove(1) == true)
 #expect(randomizedSet.insert(1) == true)  // Should be able to insert again after removal
 }
 }
 */
