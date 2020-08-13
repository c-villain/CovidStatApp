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
    
    
    var body: some View {
        VStack(alignment: .center){
            Image("AboutIcon")
            .resizable()
            .scaledToFit()
            
            .frame(width: 120, height: 120, alignment: .center)
                .offset(x: 0, y: 30)
        
            VStack(alignment: .leading){
                
                Group{
                    Spacer()
                    Text("About").font(.largeTitle).bold()
                    Spacer()
                }
                Group{
                    Text("This is an open source project")
                    linkButton(link: Constants.AboutConstants.github, buttonText: Constants.AboutConstants.github).font(.headline)
                    Spacer()
                    HStack{
                        Text("based on ")
                        linkButton(link: Constants.AboutConstants.api, buttonText: Constants.AboutConstants.api).font(.headline)
                    }
                    Spacer()
                    Group{
                        Text("Data is sourced from Johns Hopkins CSSE ")
                        linkButton(link: Constants.AboutConstants.JHApi, buttonText: Constants.AboutConstants.JHApi).font(.headline)
                    }
                    Spacer()
                    linkButton(link: Constants.AboutConstants.privacyPolicy, buttonText: "Read privacy policy").font(.headline)
                    Spacer()
                    Text("@Alexander Kraev, 2020")
                    
                }
                Group{
                    Spacer()
                    Text("Contact").font(.largeTitle).bold()
                    Spacer()
                }
                Group{
                    Text("If you have any questions or suggestions for improvement, please contact me:")
                    linkButton(link: Constants.AboutConstants.tg, buttonText: Constants.AboutConstants.tg).font(.headline)
                    Spacer()
                }
                HStack{
                    Text("or email me:")
                    linkButton(link: "mailto:\(Constants.AboutConstants.email)", buttonText: Constants.AboutConstants.email).font(.headline)
                }
            }.padding(.bottom, 75)
        }
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
