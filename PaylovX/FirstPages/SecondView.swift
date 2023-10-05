//
//  SecondView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/04/23.
//


import SwiftUI

struct Buttonmodel: View{
    
    var text = ""
    
    var body: some View{
        Button(action:{
            
        }){
            Text(text)
                .font(.custom("Rubik-Medium", size: 18))
                .padding()
            .foregroundColor(.white)
        }
    }
}

struct SecondView: View {
    
    var body: some View {
       
            
            ZStack{
                LinearGradient(gradient: Gradient(colors:[ Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    Image("logo")
                        .offset(y: -UIScreen.main.bounds.height*0.05)
                }
                ZStack{
                    Rectangle()
                        .frame(width: 121, height: 44)
                        .foregroundColor(.clear)
                        .offset(x:UIScreen.main.bounds.width/2, y: 0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(Color.white, lineWidth: 2.5))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            Text("                       ")
                            Button(action: {
                                
                            }){
                                Text("    English    ")
                                    .font(.custom("Rubik-Medium", size: 18))
                                    .padding()
                                .foregroundColor(.white)
                            }
                            Button(action: {
                                
                            }){
                                Text("    Русский    ")
                                    .font(.custom("Rubik-Medium", size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            Button(action: {
                                
                            }){
                                Text("    O'zbekcha    ")
                                    .font(.custom("Rubik-Medium", size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            Button(action: {
                                
                            }){
                                Text("      Tojikcha  ")
                                    .font(.custom("Rubik-Medium", size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            Text("                          ")
                        }
                       
                    }
                    .padding()
                }.padding(.top, 450)
                
                VStack{
                    Spacer()
                    ZStack{
                        Circle()
                        
                            .stroke(Color.white .opacity(0.5), lineWidth: 3)
                            .frame(width: 94, height: 94)
                        NavigationLink(destination: RegisterView() ){
                            Circle()
                                .frame(width: 62, height: 62)
                                .foregroundColor(.white )
                        }
                        .navigationBarBackButtonHidden()
                        Image("next")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .foregroundColor(Color("Color1"))
                    }
                }
            }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}



