class TestArray {
    var first = [5,1,4,2,8]
    var second = [64,25,12,22,11]
    var third = [6,5,3,1,8,7,2,4,9]
    var fourth = [7,1,9,5,2,0]
    let letters = ["K", "B", "Q", "A", "X", "M"]
    
    init() {
        print("Bubble sort:")
        print("Raw: \(first)")
        print("Result: \(first.bubbleSort())")
        
        print("\nSelection sort:")
        print("Raw: \(second)")
        print("Result: \(second.selectionSort())")
        
        print("\nInsertion sort:")
        print("Raw: \(third)")
        print("Insertion sort (Descending): \(third.insertionSortDesc())")
        print("Insertion sort (Ascending): \(third.insertionSortAsc())")
        
        print("\nReversed sort:")
        print("Raw: \(fourth)")
        print("Result: \(Array(fourth.reversed()))")
        
        print("\nRaw: \(letters)")
        print("Ascending sort: \(letters.sorted(by: >))")
        print("Descending sort: \(letters.sorted(by: <))")
    }
}

extension Array where Element: Comparable {

    func bubbleSort() -> [Element] {
        var array = self
        for i in (0..<array.count-1).reversed() {
            for j in (1..<(i+1)) {
                if array[j-1] > array[j] {
                    let temp = array[j-1]
                    array[j-1] = array[j]
                    array[j] = temp
                }
            }
        }
        return array
    }
}


extension Array where Element: Comparable {

    func selectionSort() -> [Element] {
        var array = self
        for i in array.indices {
            var minIndex = i
            for j in i+1..<array.count {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            let temp = array[minIndex]
            array[minIndex] = array[i]
            array[i] = temp
        }
        return array
    }
}

extension Array where Element: Comparable {

    func insertionSortDesc() -> Array<Element> {
        guard self.count > 1 else { return self }
        
        var output: Array<Element> = self
        
        for first in 0..<output.count {
            let key = output[first]
            var second = first
            
            while second > -1 {
                if key < output[second] {
                    
                    output.remove(at: second + 1)
                    output.insert(key, at: second)
                }
                second -= 1
            }
        }
        return output
    }

    func insertionSortAsc() -> Array<Element> {
        guard self.count > 1 else { return self }
        
        var output: Array<Element> = self
        
        for first in 0..<output.count {
            let key = output[first]
            var second = first
            
            while second > -1 {
                if key > output[second] {
                    
                    output.remove(at: second + 1)
                    output.insert(key, at: second)
                }
                second -= 1
            }
        }
        return output
    }
}

print(TestArray())
