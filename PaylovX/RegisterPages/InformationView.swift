//
//  InformationView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/04/23.
//

import SwiftUI

struct InformationView: View {
    
    @State private var name = ""
    @State private var iscolor = false
    @State private var isActivePassword = false
    @Binding var phoneNumber: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                HStack {
                    
                    Text("Информация")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-Medium", size: 12))
                        .foregroundColor(Color(red: 39/255, green: 49/255, blue: 64/255))
                    
                    Text("Пароль")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                        .foregroundColor(Color(red: 191/255, green: 197/255, blue: 209/255))
                    
                    Text("Пин код")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                        .foregroundColor(Color(red: 191/255, green: 197/255, blue: 209/255))
                }
                .padding(.horizontal, 50)
                
                HStack(spacing: 1.3){
                    
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
                    
                    Circle()
                        .stroke(Color(red: 211/255, green: 215/255, blue: 222/255), lineWidth: 3)
                        .frame(width: 12, height: 12)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                        .frame(height: 3)
                        .background(Color(red: 211/255, green: 215/255, blue: 222/255))
                }
                .padding(.bottom)
                
                
                VStack{
                    
                    VStack (alignment: .leading,spacing: 8) {
                        Text("Имя")
                            .font(.custom("Rubik-Medium", size: 14))
                            .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                           
                        TextField("Введите ваше имя", text: $name)
                            .padding(.horizontal,10)
                            .frame(height: 44)
                            .font(.custom("Rubik-VariableFont_wght", size: 16))
                            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
                            .cornerRadius(8)
                           
                    }
                    VStack (alignment: .leading) {
                        Text("Номер телефона")
                            .font(.custom("Rubik-Medium", size: 14))
                            .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                            .padding(.top,16)
                        ZStack {
                            Rectangle()
                                .frame(height: 44)
                                .foregroundColor(Color(red: 247/255, green: 247/255, blue: 247/255))
                                .cornerRadius(8)
                            
                            HStack {
                                Text("+\(phoneNumber)")
                                    .font(.custom("Rubik-VariableFont_wght", size: 16))
                                    .foregroundColor(Color(red: 131/255, green: 144/255, blue: 166/255))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Button(action: {
                                    
                                }, label: {
                                    Image("pencil")
                                        .resizable()
                                        .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                                        .frame(width: 24, height: 24)
                                })
                            }
                            .padding(.horizontal, nil)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                    .frame(maxHeight: .infinity)
                
                VStack (spacing: 16){
                    Text("Нажавь продоложить вы подверждаете свое согласие с \n условия пользования и политикой конфиденциальности")
                        .multilineTextAlignment(.center)
                        .font(.custom("Rubik-VariableFont_wght", size: 12))
                    
                    NavigationLink( destination: PasswordView( phoneNumber: $phoneNumber)){
                            Text("Продолжить")
                                .foregroundColor(.white)
                                .font(.custom("Rubik-VariableFont_wght", size: 14))
                                .clipShape(Rectangle())
                                .frame(maxWidth: .infinity)
                                .frame(height: 44, alignment: .center)
                                .background(name.isEmpty ? Color.gray .opacity(0.5) : Color(red: 27/255, green: 150/255, blue: 132/255))
                                .cornerRadius(8)
                        }
                        .disabled(name.isEmpty)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
            }
            .padding(.top,13)
            
            .navigationTitle("Регистрация")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image( "back")
                            .frame(width:24, height: 24)
                            .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                    }
                }
            }
        }.navigationBarBackButtonHidden()
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(phoneNumber: Binding<String>(get: {""}, set: {newvalue in}))
    }
}
