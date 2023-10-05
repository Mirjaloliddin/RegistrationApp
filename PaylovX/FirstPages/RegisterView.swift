//
//  RegisterView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/04/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var type = ""
    var typs = ["UZB", "RU", "USA"]
    @State var phoneNumber = ""
    @State private var isProcessing = false
    @State private var isLoading = false
    @State private var isKeyboardVisible = false
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors:[ Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Image("logo")
                        .padding(.top, 60)
                    
                    Text("Благие поступки в каждом платеже")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-VariableFont_wght", size: 14))
                        
                    
                    Text("Номер телефона")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-Medium", size: 14))
                        .padding(.top, 118)
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .padding(.horizontal)
                    HStack{
                        ZStack{
                            
                            Rectangle()
                                .frame(height: 44)
                                .foregroundColor(.white .opacity(0.3))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            
                            HStack{
                                
                                Text(" + ")
                                    .foregroundColor(.white)
                                    .font(.custom("Rubik-VariableFont_wght", size: 18))
                                    .padding(.leading)
                                
                                TextField("000 00 000 00 00", text: $phoneNumber)
                                    .font(.custom("Rubik-VariableFont_wght", size: 18))
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.white)
                                    .padding(.leading, -10)
                                    .onChange(of: phoneNumber) { newValue in
                                        var formattedNumber = newValue.filter { "0123456789".contains($0) }
                                        if formattedNumber.count > 3 {
                                            formattedNumber.insert(" ", at: formattedNumber.index(formattedNumber.startIndex, offsetBy: 3))
                                        }
                                        if formattedNumber.count > 6 {
                                            formattedNumber.insert(" ", at: formattedNumber.index(formattedNumber.startIndex, offsetBy: 6))
                                        }
                                        if formattedNumber.count > 10 {
                                            formattedNumber.insert(" ", at: formattedNumber.index(formattedNumber.startIndex, offsetBy: 10))
                                        }
                                        if formattedNumber.count > 13 {
                                            formattedNumber.insert(" ", at: formattedNumber.index(formattedNumber.startIndex, offsetBy: 13))
                                        }
                                        if formattedNumber.count > 16 {
                                            formattedNumber = String(formattedNumber.prefix(16))
                                        }
                                        phoneNumber = formattedNumber
                                        
                                    }
                                if phoneNumber.count == 16 {
                                    if isLoading == false {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle())
                                            .foregroundColor(.blue)
                                            .padding(.trailing, 40)
                                            .onAppear{
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    isLoading = true
                                                    print("Номер телефона: \(phoneNumber)")
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    VStack{
                        if  phoneNumber.count == 16 {
                            ZStack{
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width*0.9, height: 64)
                                    .foregroundColor(.white )
                                    .cornerRadius(12)
                                HStack{
                                    Text("Так вы у нас впервые? 🤓 \nДавайте начнем регистрацию")
                                        .font(.custom("Rubik-VariableFont_wght", size: 14))
                                        .foregroundColor(Color(red: 51/255, green: 64/255, blue: 85/255))
                                        
                                    Button(action: { }){
                                        NavigationLink(destination: InformationView(phoneNumber: $phoneNumber)){
                                            Text("Регистрация")
                                                .padding(.horizontal, 8)
                                                .padding(.vertical,13)
                                                .foregroundColor(.white)
                                                .font(.custom("Rubik-Medium", size: 14))
                                                .background(Color("Color1"))
                                                .cornerRadius(8)
                                        }
                                        
                                    }
                                    .padding(.vertical,20)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                self.isKeyboardVisible = false
            }
        }.navigationBarBackButtonHidden()
        
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

