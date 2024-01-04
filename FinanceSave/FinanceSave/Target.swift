//
//  Targets.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import SwiftUI

struct Targets: View {
    @StateObject var dataManager = DataManager()
    var body: some View {
        VStack {
            Text("Hedef Belirleyin!")
                .font(.title3)
                .frame(width: Const.width * 0.5, height: Const.height * 0.05)
            Spacer()
            textfieldss(title: "Ne kadarlık bir birikim?", text: $dataManager.userTarget)
                .keyboardType(.numberPad)
            
            textfieldss(title: "Ne için biriktireceksiniz", text: $dataManager.purpose)
                .keyboardType(.default)
            Spacer()
            Button(action: {
                // Use dataManager.purpose directly
                var userPurpose = dataManager.purpose
                var userTarget = dataManager.userTarget
                
                // Check if the userPurpose is not empty before saving
                if !userPurpose.isEmpty{
                    dataManager.saveData()
                    // Optionally clear the purpose if needed
                    dataManager.purpose = ""
                    dataManager.userTarget = ""
                }                }) {
                    Text("Save")
                        .padding()
                        .font(.title3)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
        }.frame(width: Const.width * 0.9)
    }
    @ViewBuilder
    func textfieldss(title: String, text: Binding<String>) -> some View{
        TextField(title, text: text).multilineTextAlignment(.center).padding().frame(width: 250).background(Color.green.opacity(0.3)).cornerRadius(10)
    }
}

#Preview {
    Targets()
}


