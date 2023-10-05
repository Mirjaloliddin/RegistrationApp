//
//  SMSCodeView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 26/04/23.
//

import SwiftUI

struct SMSCodeView: View {
    
    @Binding var phoneNumber: String
    @State  var verifyCode = ""
    @State var timeRemaining = 60
    @State var otpText = ""
    @FocusState private var isKeyboardShowing: Bool
    @Environment(\.presentationMode) var presentationMode
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView{
            
            VStack{
                
                ZStack{
                    
                    Circle()
                        .stroke(Color.green .opacity(0.1), lineWidth: 3)
                        .frame(width: 85, height: 85)
                    
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color("Color2"))
                    
                    Image(systemName: "phone.arrow.down.left")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                VStack{
                    
                    Text("Подвердите смс код")
                        .font(.system(size: 20))
                        .bold()
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(height: 80)
                            .cornerRadius(12)
                            .foregroundColor(.gray .opacity(0.12))
                            .padding()
                        
                        HStack{
                            
                            Text("Код верификации был отправлен \nна номер \(phoneNumber)")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,30)
                            
                            ZStack{
                                Rectangle()
                                    .frame(width: 45, height: 45)
                                    .cornerRadius(10)
                                    .foregroundColor(.gray .opacity(0.3))
                                
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                            }.padding(.trailing,30)
                        }
                    }
                    
                    Text("Код верификации")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    ZStack{
                        Rectangle()
                            .frame(height: 70)
                            .cornerRadius(12)
                            .foregroundColor(.gray .opacity(0.05))
                            .padding(.horizontal)
                        HStack(spacing: 0){
                            ForEach(0..<6,id: \.self){index in
                                    
                                OTPTextBox(index)
                            }
                        }.padding(.horizontal)
                        .background(content: {
                            TextField("j", text: $otpText.limit(6))
                                .keyboardType(.numberPad)
                                .textContentType(.oneTimeCode)
                                .frame (width: 1, height: 1)
                                .opacity (0.001)
                                .blendMode(.screen)
                                .focused($isKeyboardShowing)
                        })
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isKeyboardShowing.toggle()
                        }
                        
                    }
                    
                    HStack{
                        Text("Отправить код снова через")
                            .font(.system(size: 16))
                        
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        ZStack{
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 35, height: 35)
                            
                            Text("\(timeRemaining)")
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                }
                        }
                    }
                }
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .keyboard){
                    Button("Done"){
                        isKeyboardShowing.toggle()
                    }
                    
                }
            }
            .padding(.top,40)
            .navigationTitle("Подтверждение")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Отмена")
                            .font(.custom("Rubik-VariableFont_wght", size: 14))
                            .foregroundColor(Color(red: 27/255, green: 150/255, blue: 132/255))
                        
                    }
                }
            }
            
        }
    }
    @ViewBuilder
    func OTPTextBox(_ index: Int)->some View{
        ZStack{
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            }else{
                Text(" ")
            }
        }
        
        .frame (width: 45, height: 45)
        .background {
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? Color(red: 27/255, green: 150/255, blue: 132/255) : .gray, lineWidth: status ? 1 : 0.5)
        }
        .frame (maxWidth: .infinity)
    }
}

struct SMSCodeView_Previews: PreviewProvider {
    static var previews: some View {
        SMSCodeView(phoneNumber: Binding<String>(get: {""}, set: {newvalue in}))
    }
}
//extension View{
//    func disablewithOpacity(_ condition: Bool)->some View{
//        self
//            .disabled(condition)
//            .opacity(condition ? 0.1 : 1)
//    }
//}
extension Binding where Value == String{
    func limit(_ length: Int)->Self{
        if self.wrappedValue.count > length{
            DispatchQueue.main.async{
                self.wrappedValue = String(self.wrappedValue.prefix (length))
            }
        }
        return self
    }
}
