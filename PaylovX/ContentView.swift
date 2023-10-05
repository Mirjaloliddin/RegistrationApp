//
//  ContentView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/04/23.
//
import SwiftUI

struct ContentView: View {
    @Binding var phoneNumber: String
    var body: some View {
        if #available (iOS 15, *){
            NavigationView{
                SMSCodeView(phoneNumber:$phoneNumber )
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
            }
        } else {
            NavigationStack{
                SMSCodeView(phoneNumber: $phoneNumber)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar (.hidden, for: .navigationBar)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(phoneNumber: Binding<String>(get: {""}, set: {newvalue in}))
    }
}


