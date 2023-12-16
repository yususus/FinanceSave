//
//  HomeView.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @ObservedObject var dataManager: DataManager
    var body: some View {
        
        NavigationStack{
            ToolBar()
            VStack {
                // total saving
                Spacer()
                Text("125,000.00$").font(.largeTitle)
                    .frame(width: UIScreen.main.bounds.width)
                Text("Biriktilen Tutar").font(.title2)
                    .frame(width: UIScreen.main.bounds.width, height:30, alignment: .center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                Spacer()
                
                //achievement
                VStack{
                    HStack {
                        Text("Hedefler")
                        Spacer()
                        Text("5")
                    }.padding(.horizontal).padding()
                    HStack {
                        Text("Tamamlananlar")
                        Spacer()
                        Text("3")
                    }.padding(.horizontal).padding()
                    HStack{
                        Text("Toplam biriken")
                        Spacer()
                        Text("\(dataManager.totalMoney, specifier: "%.2f")")
                    }.padding(.horizontal).padding()
                }.frame(maxWidth: .infinity).background(Color.mint.opacity(0.3))
                    .cornerRadius(10)
                
                //dates
                VStack(alignment: .leading){
                    Text("Birikimler")
                    Divider()
                        .frame(minHeight: 3)
                        .overlay(Color.mint)
                    ForEach(dataManager.userInputs.reversed().prefix(5), id: \.self) { userInput in
                        HStack {
                            Text("11.11.2023")
                            Spacer()
                            Text(userInput)
                        }
                    }
                }.padding().padding().background()
            }
            
            
        }
        .onAppear {
            dataManager.loadData()
        }
    }
}

#Preview {
    HomeView(dataManager: DataManager())
}

@ViewBuilder
func ToolBar() -> some View {
    HStack {
        NavigationLink {
            Targets()
        } label: {
            TextBtn(text: "Hedef")
        }
        Spacer()
        
        NavigationLink{
            PlusView()
        }label: {
            TextBtn(text: "Ekle")
        }
    }.frame(width: Const.width * 0.9)
}
@ViewBuilder
func TextBtn(text: String) -> some View{
    Text(text).frame(width:Const.width*0.2,height: Const.height*0.04)
        .background(Color.mint).cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 15, y: 5)
        .foregroundColor(.white)
}
