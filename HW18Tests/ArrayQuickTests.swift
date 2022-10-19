import XCTest
import Quick
import Nimble
@testable import HW18

class ArrayQuickTests: QuickSpec {
    override func tearDown() {
    
    }

    override func spec() {
        describe("ArrayQuickTests") {
            it("result") {

                expect(TestArray().first.bubbleSort()).to(equal([1, 2, 4, 5, 8]))
                expect(TestArray().second.selectionSort()).to(equal([11, 12, 22, 25, 64]))
                expect(TestArray().third.insertionSortDesc()).to(equal([1, 2, 3, 4, 5, 6, 7, 8, 9]))
                expect(TestArray().third.insertionSortAsc()).to(equal([9, 8, 7, 6, 5, 4, 3, 2, 1]))
                expect(TestArray().fourth.reversed()).to(equal([0, 2, 5, 9, 1, 7]))
                expect(TestArray().letters.sorted(by: >)).to(equal(["X", "Q", "M", "K", "B", "A"]))
                expect(TestArray().letters.sorted(by: <)).to(equal(["A", "B", "K", "M", "Q", "X"]))
            }
        }
    }
}
