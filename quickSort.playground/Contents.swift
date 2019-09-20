//: Playground - noun: a place where people can play

import UIKit

//
// Time Complexity O(nlogn)
// Space Complexity O(n)
//
class QuickSort<T:Comparable>{
    
    typealias Element = T
    
    var dataArray:[T]
    
    init(_ array: [Element]) {
        self.dataArray = array
    }
    
    // pivot 을 구하는 함수
    private func pivot(_ start:Int, _ end:Int) -> Int {
        // 피봇값을 임시 저장함
        let pivotValue = dataArray[(start + end) / 2]
        var start = start
        var end = end
        
        //start인덱스가 end 인덱스를 넘기 전까지 루프
        while(start <= end) {
            
            //start 인덱스 값이 피봇값보다 작을경우 start 인덱스를 오른쪽으로 이동
            while (dataArray[start] < pivotValue) {
                start += 1
            }
            
            //피봇값보다 end 인덱스 값이 클 경우 end 인덱스를 오른쪽으로 이동
            while(pivotValue < dataArray[end]) {
                end -= 1
            }
            
            // 만약 start 인덱스와 end 인덱스가 만나지 않고 멈춰있다면(두개를 바꿔야할 상황)
            // 두가지 위치를 교환
            if (start <= end) {
                print("swap [ \(dataArray[start]) ] <-> [ \(dataArray[end]) ]")
                let temp = dataArray[start]
                dataArray[start] = dataArray[end]
                dataArray[end] = temp
                start += 1
                end -= 1
            }
        }
        
        return start
    }
    
    
    func sortByQuick() {
        sortByQuick(0, dataArray.count - 1)
    }
    
    // pivot을 통해서 최대로 쪼개서 큰수와 작은수를 정렬시키는 재귀함수
    private func sortByQuick(_ start:Int, _ end:Int) {
        
        let point = pivot(start, end)
        
        print("sortByQuick(\(start), \(end)), pivot: \(point)")
        
        if (start < point - 1) {
            sortByQuick(start, point - 1)
        }
        
        if (point < end) {
            sortByQuick(point, end)
        }
    }
}

var quick = QuickSort<Int>([6, 5, 1, 4, 2, 3, 7])
quick.sortByQuick()
print(quick.dataArray)

