//
//  DetailView.swift
//  Friendface
//
//  Created by Biagio Ricci on 15/02/23.
//

import SwiftUI

struct DetailView: View {
    let user: Result
    var body: some View {
        ScrollView{
            VStack{
                Text("\(user.name)")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Age: \(user.age)")
                    //Spacer()
                    Text("About: \(user.about)")
                    //Spacer()
                    Text("Address: \(user.address)")
                    //Spacer()
                    Text("Company: \(user.company)")
                    //Spacer()
                    VStack(alignment: .leading){
                            Text("Friends:")
                            ForEach(user.friends) { friend in
                                Text(friend.name)
                        }
                    }
                    Text("Registered on: \(user.registered)")
                }
                .padding()
            }
        }
    }
}


/*struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}*/
