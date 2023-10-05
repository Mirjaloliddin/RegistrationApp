//
//  RectangleCircleView.swift
//  PaylovX
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 25/04/23.
//

import SwiftUI

struct RectangleCircleView: View {
    var body: some View {
        VStack{
            HStack(spacing: UIScreen.main.bounds.width*0.19) {
                Text("Информация")
                    .font(.system(size: 14))
                    .bold()
                Text("Пароль")
                    .font(.system(size: 14))
                    .bold()
                    .offset(x:-17)
                Text("Пин код")
                    .font(.system(size: 14))
                    .bold()
                    .offset(x:-20)
            }
            Group{
                HStack(spacing:2){
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width*0.22, height: 2)
                        .foregroundColor(Color("Color2"))
                    Circle()
                        .stroke(Color("Color1"), lineWidth: 4)
                        .frame(width: 12, height: 12)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width*0.28, height: 2)
                        .foregroundColor(.gray)
                    Circle()
                        .stroke(Color.gray, lineWidth: 4)
                        .frame(width: 12, height: 12)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width*0.28, height: 2)
                        .foregroundColor(.gray)
                    Circle()
                        .stroke(Color.gray, lineWidth: 4)
                        .frame(width: 12, height: 12)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width*0.22, height: 2)
                        .foregroundColor(.gray)
                    
                }.padding(.bottom,40)
            }
        }
    }
}

struct RectangleCircleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCircleView()
    }
}
