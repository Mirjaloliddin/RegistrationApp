//
//  FirstView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/04/23.
//

import SwiftUI

struct FirstView: View {
    
    @State private var isLoading = false
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors:[ Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Image("logo")
                        .offset(y: UIScreen.main.bounds.height*0.001)
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 92, height: 92)
                        Circle()
                            .trim(from: 0, to: isLoading ? 1.0 : 0)
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: 92, height: 92)
                            .rotationEffect(.degrees(270))
                            .animation(Animation.linear(duration: 1.5))
                            
                    }
                    .onAppear {
                        self.isLoading = true
                    }
                }
                VStack{
                    if isActive {
                        SecondView()
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    isActive = true
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
