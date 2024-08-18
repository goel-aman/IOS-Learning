//
//  ViewController.swift
//  CombineFlatMapOperator
//
//  Created by aman on 16/08/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var blogPublisher = PassthroughSubject<PostQuery, URLError>()
    var cancellable: AnyCancellable!
    var cancellables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let publisher = blogPublisher.flatMap(maxPublishers: .unlimited) { postquery -> URLSession.DataTaskPublisher in
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postquery.id)")!
            return URLSession.shared.dataTaskPublisher(for: url)
        }.eraseToAnyPublisher()
        
        
        publisher.map {
            $0.data
        }.decode(type: Post.self, decoder: JSONDecoder())
        .sink { completion in
            switch completion {
            case .finished:
                print("aman completion is: ",completion)
            case .failure(let error):
                print(error)
            }
        } receiveValue: { output in
            print("aman output is: ",output)
        }.store(in: &cancellables)
        
        
        blogPublisher.send(PostQuery(id: "1"))
    }
}


// Query Object
struct PostQuery {
    let id: String
}

// Result Representation
struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}

