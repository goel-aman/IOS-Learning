//
//  Flow.swift
//  QuizEngine
//
//  Created by aman on 02/10/24.
//

protocol Router {
    typealias AnswerCallBack = (String) -> Void
    func routeTo(question: String, answerCallBack: @escaping AnswerCallBack)
    func routeTo(result: [String: String])
}

class Flow {
    private let router: Router
    private let questions: [String]
    
    private var result: [String: String] = [:]
    
    init(questions: [String], router: Router) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallBack: routerNext(from: firstQuestion))
        } else {
            router.routeTo(result: [:])
        }
    }
    
    private func routerNext(from question: String) -> Router.AnswerCallBack {
        return { [weak self] answer in
            guard let self = self else { return }
            
            // mostly result should be updated here.... I guess...
            
            if let currentQuestionIndex = questions.index(of: question) {
                self.result[question] = answer
                if currentQuestionIndex + 1 < self.questions.count {
                    let nextQuestion = questions[currentQuestionIndex + 1]
                    router.routeTo(question: nextQuestion, answerCallBack: routerNext(from: nextQuestion))
                } else {
                    self.router.routeTo(result: self.result)
                }
            }
        }
    }
}
