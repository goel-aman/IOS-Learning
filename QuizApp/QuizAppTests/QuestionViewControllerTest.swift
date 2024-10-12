//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by aman on 08/10/24.
//

import XCTest

final class QuestionViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersQuestionHeaderText() {
        let sut = QuestionViewController(question: "Q1")
        
        _ = sut.view
        
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
}
