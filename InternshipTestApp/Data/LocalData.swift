//
//  LocalData.swift
//  InternshipTestApp
//
//  Created by Oleg Arnaut  on 15.01.2024.
//

import Foundation

class LocalData : ObservableObject{
    
    @Published var allResult : Result?
    
    init(){
        loadData()
    }
    
    func loadData(){
        
        if let url = Bundle.main.url(forResource: "result", withExtension: "json") {
                
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                            let result = try decoder.decode(Result.self, from: data)
                 allResult = result
                            
            } catch {
                print("Can not load JSON file.")
            }
        }
    }
}
