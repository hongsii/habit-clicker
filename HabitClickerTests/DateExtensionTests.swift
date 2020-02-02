//
//  DateExtensionTests.swift
//  HabitClickerTests
//
//  Created by red.bean on 2020/02/02.
//  Copyright © 2020 hongsii. All rights reserved.
//

import XCTest
@testable import HabitClicker

class DateExtensionTests: XCTestCase {

    func testShouldConvertDate() {
        // given
        let formatter = DateFormatter()
        let date = formatter.date(from: "2020-02-02 23:20:10")
        
        // when
        let actual = date?.toDate()
    
        // then
        XCTAssertEqual(actual, formatter.date(from: "2020-02-02 00:00:00"))
    }
}
