//
//  ContentView.swift
//  Friendface
//
//  Created by Biagio Ricci on 15/02/23.
//

import SwiftUI



struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(results) {result in NavigationLink {
                    DetailView(user: result)
                } label: {
                    HStack {
                        if result.isActive == true {
                            Text("🟢")
                        }
                        else {
                            Text("🔴")
                        }
                        Text(result.name)
                    }
                }
                    
                }
            }
            .navigationTitle("Friendface")
            .task {
                await loadData()
            }
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        if results.isEmpty {
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                results = try decoder.decode([Result].self, from: data)
            } catch {
                print("Invalid data")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
