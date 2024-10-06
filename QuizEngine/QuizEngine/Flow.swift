//
//  Flow.swift
//  QuizEngine
//
//  Created by aman on 02/10/24.
//

protocol Router {
    typealias AnswerCallBack = (String) -> Void
    func routeTo(question: String, answerCallBack: @escaping AnswerCallBack)
}

class Flow {
    private let router: Router
    private let questions: [String]
    
    init(questions: [String], router: Router) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallBack: routerNext(from: firstQuestion))
        }
    }
    
    private func routerNext(from question: String) -> Router.AnswerCallBack {
        return { [weak self] _ in
            guard let self = self else { return }
            
            if let currentQuestionIndex = questions.index(of: question) {
                if currentQuestionIndex + 1 < self.questions.count {
                    let nextQuestion = questions[currentQuestionIndex + 1]
                    router.routeTo(question: nextQuestion, answerCallBack: routerNext(from: nextQuestion))
                }
            }
        }
    }
}
