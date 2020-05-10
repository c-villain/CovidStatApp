//
//  AboutView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    func linkButton(link: String, buttonText: String) -> AnyView{
        
        return AnyView(Button(action: {
            UIApplication.shared.open(URL(string: link)!)
        }) {
            Text(buttonText)
        })
    }
    let email = "lexkraev@gmail.com"
    
    var body: some View {
        VStack(alignment: .leading){
            Group{
                Spacer()
                Text("About").font(.largeTitle)
                Spacer()
                
                Text("This is an open source project")
                
                
                linkButton(link: "https://github.com/c-villain/CovidStatApp", buttonText: "https://github.com/c-villain/CovidStatApp").font(.headline)
                Spacer()
                HStack{
                    Text("based on ")
                    linkButton(link: "https://covid19api.com", buttonText: "https://covid19api.com").font(.headline)
                }
                Spacer()
                Text("@Alexander Kraev, 2020")
                
            }
            Group{
                Spacer()
                Spacer()
                Spacer()
                Text("Contact").font(.largeTitle)
                Spacer()
                Text("If you have any questions or suggestions for improvement, please contact me:")
                linkButton(link: "t.me/cvillain", buttonText: "t.me/cvillain").font(.headline)
            }
            HStack{
                Text("or email me:")
                linkButton(link: "mailto:\(email)", buttonText: "lexkraev@gmail.com").font(.headline)
            }
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
