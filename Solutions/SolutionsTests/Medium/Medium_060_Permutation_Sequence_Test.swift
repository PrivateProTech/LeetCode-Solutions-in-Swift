//
//  Medium_060_Permutation_Sequence_Test.swift
//  Solutions
//
//  Created by Di Wu on 6/17/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_060_Permutation_Sequence_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [Int] = [3, 1]
        let expected: String = "123"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Int] = [4, 24]
        let expected: String = "4321"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Int] = [4, 23]
        let expected: String = "4312"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [Int], expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_060_Permutation_Sequence.getPermutation(n: input[0], k: input[1])
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
