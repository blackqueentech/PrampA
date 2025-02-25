//
//  ContentView.swift
//  PrampA
//
//  Created by Della Anjeh on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var results = [Breed]()
    
    var body: some View {
        NavigationStack {
            Group {
                if results.isEmpty {
                    Text("No breeds found")
                } else {
                    List(results, id: \.id) { breed in
                        NavigationLink{
                            DetailsView(breed: breed)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(breed.name)
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .task {
                await loadData()
            }
            .navigationTitle("Catssss")
        }
    }
    
    func loadData() async {
        let apiKey = "live_VRPWG9rpeFHORT9SAE2GV7Fl0SkbVAUquEQk5yzFdrLL0hBE3vXnInkbk6u1V7kQ"
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?api_key=\(apiKey)")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([Breed].self, from: data)
            results = decodedResponse
        } catch {
            print("Invalid data, see error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
