//
//  SearchVIew.swift
//  ProductApp
//
//  Created by InApp on 06/11/22.
//

import SwiftUI

struct SearchVIew: View {
    @Binding var textInput : String
    @State var searchText : String
    var body: some View {
        HStack {
            TextField(
              "Search Items...",
              text: $searchText
            
            ).padding()
            
            Spacer()
            Button(action: {
              textInput = searchText
                
            })
            {
                Image(systemName: "magnifyingglass")
                    .frame(minWidth: 0, maxWidth: 20,maxHeight: 15)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.clear, lineWidth: 2)
                )
            }
            .background(Color("PinkBg"))
            .cornerRadius(5)
            .padding([.top, .bottom, .trailing], 5.0)
            
        }   .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
    )
    }
    
}

struct SearchVIew_Previews: PreviewProvider {
    static var previews: some View {
        SearchVIew(textInput: .constant(""), searchText: "")
    }
}
