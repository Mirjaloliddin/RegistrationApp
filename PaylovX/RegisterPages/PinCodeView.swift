//
//  PinCodeView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 28/04/23.
//

import SwiftUI

struct PinCodeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var pinCode = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    
                    Text("Информация")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                        .foregroundColor(Color(red: 27/255, green: 150/255, blue: 132/255))
                    
                    Text("Пароль")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                        .foregroundColor(Color(red: 27/255, green: 150/255, blue: 132/255))
                    
                    
                    Text("Пин код")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-Medium", size: 12))
                        .foregroundColor(Color(red: 39/255, green: 49/255, blue: 64/255))
                }
                .padding(.horizontal, 50)
                
                HStack(spacing:1.35) {
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 3)
                        .background(Color(red: 27/255, green: 150/255, blue: 132/255))
                    
                    Circle()
                        .stroke(Color(red: 27/255, green: 150/255, blue: 132/255), lineWidth: 3)
                        .frame(width: 12, height: 12)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 3)
                        .background(Color(red: 27/255, green: 150/255, blue: 132/255))
                    
                    Circle()
                        .stroke(Color(red: 27/255, green: 150/255, blue: 132/255), lineWidth: 3)
                        .frame(width: 12, height: 12)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 3)
                        .background(Color(red: 27/255, green: 150/255, blue: 132/255))
                    
                    Circle()
                        .stroke(Color(red: 27/255, green: 150/255, blue: 132/255), lineWidth: 3)
                        .frame(width: 12, height: 12)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 3)
                        .background(Color(red: 27/255, green: 150/255, blue: 132/255))
                }
                .padding(.bottom)
                Spacer()
                    .frame(height: 40)
                ZStack{
                    
                        Rectangle()
                            .foregroundColor(Color(red: 27/255, green: 150/255, blue: 132/255))
                            .cornerRadius(40)
                            .edgesIgnoringSafeArea(.bottom)
                    VStack(alignment: .center){
                        Image("lock")
                            .resizable()
                            .frame(width: 32, height: 32)
                        Text("Повторите пин-код")
                            .font(.custom("Rubik-Medium", size: 20))
                            .foregroundColor(.white)
                            .padding(.top,24)
                        SecureField("0 0 0 0", text: $pinCode)
                            .padding()
                            .padding(.horizontal,150)
                            .foregroundColor(.white)
                        HStack{
                            ForEach(1..<4){ value in
                                Circle()
                                    .frame(width: 75, height:75)
                                    .padding()
                                    .foregroundColor(.white .opacity(0.2))
                            }
                        }
                    }
                }
            }
        
            .navigationTitle("Регистрация")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image("back")
                            .frame(width:24, height: 24)
                            
                            .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                    }
                }
            }
        }
    }
}

struct PinCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeView()
    }
}
