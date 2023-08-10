//
//  ViewModel.swift
//  CoffeShop
//
//  Created by Armando Rodríguez on 09/08/23.
//

import SwiftUI

class CoffeViewModel: ObservableObject {
    @Published var coffeImageURL: URL?
    
    func fetchCoffeImage() async {
        let url = URL(string: "https://coffee.alexflipnote.dev/random.json")!
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let imageURL = try decoder.decode(CoffeResponse.self, from:data)
            self.coffeImageURL = imageURL.file
        }catch{
            print("Error \(error)")
        }
        
        
        
    }
}

