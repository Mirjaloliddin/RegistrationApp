//
//  PasswordView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 26/04/23.
//

import SwiftUI

struct PasswordView: View {
    
    @State var password1 = ""
    @State var password2 = ""
    @Environment(\.presentationMode) var presentationMode
    @State var showingDetail = false
    @Binding var phoneNumber: String
    @State var isPasswordHidden = false
    @State var isPasswordHiddenConfrim = false
    var body: some View {
      
        NavigationView {
            VStack{
                HStack {
                    
                    Text("Информация")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                        .foregroundColor(Color(red: 27/255, green: 150/255, blue: 132/255))
                    
                    Text("Пароль")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-Medium", size: 12))
                        .foregroundColor(Color(red: 39/255, green: 49/255, blue: 64/255))
                    
                    Text("Пин код")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                        .foregroundColor(Color(red: 191/255, green: 197/255, blue: 209/255))
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
                        .background(Color(red: 211/255, green: 215/255, blue: 222/255))
                    
                    Circle()
                        .stroke(Color(red: 211/255, green: 215/255, blue: 222/255), lineWidth: 3)
                        .frame(width: 12, height: 12)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 3)
                        .background(Color(red: 211/255, green: 215/255, blue: 222/255))
                }
                .padding(.bottom)
               
                Text("Пароль")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,20)
                ZStack {
                    Rectangle()
                          .frame(height: 44)
                          .cornerRadius(8)
                          .foregroundColor(Color(red: 247/255, green: 247/255, blue: 247/255))
                          .padding(.horizontal)
                      HStack{
                          if isPasswordHidden{
                              TextField("Придумайте надежный пароль", text: $password1)
                          }else{
                              SecureField("Придумайте надежный пароль", text: $password1)
                          }
                         
                          Button(action: {
                              isPasswordHidden.toggle()
                          }){
                              if isPasswordHidden == false {
                                  Image("eye")
                                      .foregroundColor(.gray)
                              }else{
                                  Image(systemName: "eye.slash")
                                      .foregroundColor(.gray)
                              }
                          }
                      }.padding(.horizontal,30)
                 
                }
                
                Text("Подтвердите пароль")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,20)
                
                ZStack {
                  Rectangle()
                        .frame(height: 44)
                        .cornerRadius(8)
                        .foregroundColor(Color(red: 247/255, green: 247/255, blue: 247/255))
                        .font(.custom("Rubik-VariableFont_wght", size: 16))
                        .padding(.horizontal)
                    HStack{
                        if isPasswordHiddenConfrim{
                            TextField("Повторно введите пароль", text: $password2)
                        }else{
                            SecureField("Повторно введите пароль", text: $password2)
                        }
                       
                        Button(action: {
                            isPasswordHiddenConfrim.toggle()
                        }){
                            if isPasswordHiddenConfrim == false {
                                Image("eye")
                                    .foregroundColor(.gray)
                            }else{
                                Image(systemName: "eye.slash")
                                    .foregroundColor(.gray)
                            }
                        }
                    }.padding(.horizontal,30)
                }
                
                Spacer()
                
                Button(action: {
                    showingDetail = true
                }, label: {
                    Text("Продолжить")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-VariableFont_wght", size: 14))
                        .clipShape(Rectangle())
                        .frame(maxWidth: .infinity)
                        .frame(height: 44, alignment: .center)
                        .background((password1.isEmpty || password2.isEmpty || password1 != password2 ) ? Color.gray .opacity(0.5) : Color("Color2"))
                        .cornerRadius(8)
                })
                .disabled(password1 != password2 )
                .sheet(isPresented: $showingDetail) {
                    SMSCodeView(phoneNumber: $phoneNumber)
                }
            
                .padding(.horizontal)
                .padding(.bottom)
            } .padding(.top)
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
            
        }.navigationBarBackButtonHidden()
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(phoneNumber: Binding<String>(get: {""}, set: {newvalue in}))
    }
}
