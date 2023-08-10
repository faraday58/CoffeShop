//
//  ContentView.swift
//  CoffeShop
//
//  Created by Armando Rodríguez on 09/08/23.
//

import SwiftUI



struct CoffeView: View {
    @StateObject private var viewModel = CoffeViewModel()
    
    var body: some View {
       
        VStack {
            
            if let imgURL = viewModel.coffeImageURL{
                
                AsyncImage(url: imgURL){ phase in
                    switch phase{
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "exclamationmark.icloud")
                    @unknown default:
                        Text("Hubo un error")
                        
                    }
                    
                }
            } else{
                
                Text("Cargando Imágenes de café")
            }
            Button("Nuevo Café"){
                Task{
                    await viewModel.fetchCoffeImage()
                }
            }
            .buttonStyle(.borderedProminent)
            
        }.task {
            await viewModel.fetchCoffeImage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeView()
    }
}
