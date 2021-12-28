//
//  TriviaManager.swift
//  Trivia
//
//  Created by Yathansh Raj on 28/12/21.
//

import Foundation

class TriviaManager: ObservableObject{
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    
    init(){
        Task.init{
            await fetchTrivia()
        }
    }
    func fetchTrivia() async{
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("missing url") }
        let urlRequest = URLRequest(url:url)
        
        do{
            let (data, response) = try await URLSession.shared.data(for:urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.trivia = decodedData.results
                self.length = self.trivia.count
            }
            
        }catch{
            print("Error fetching data")
        }
        
    }
    func goToNextQuestion(){
        if index + 1 < length{
            index+=1
            //setques
        } else{
            reachedEnd = true
        }
    }
}
