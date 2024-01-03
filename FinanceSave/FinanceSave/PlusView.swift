//
//  PlusView.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import SwiftUI

struct PlusView: View {
    @StateObject var dataManager = DataManager()
    func newFocus() {
        if dataManager.itemtotal >= Double(dataManager.userTarget)! {
            dataManager.itemtotal = 0
        }
    }
    var body: some View {
            VStack {
                Spacer()
                Text("Hedefe Kalan: \(dataManager.remaining, specifier: "%.1f")").padding()
                    .font(.title).frame(width: Const.width * 0.56, height: Const.height * 0.15).background(Color.orange.opacity(0.5)).shadow(color: .orange, radius: 40).cornerRadius(30)
                Spacer()
                CircleProgress(progress: dataManager.itemtargetProgress, total: dataManager.itemtotal)
                Spacer()
                Spacer()
                Spacer()
                // number input
                TextField("Birikim Ekleyin ", text: $dataManager.userInput)
                    .keyboardType(.decimalPad)
                    .padding().frame(width: 250).background(Color.green.opacity(0.3)).cornerRadius(10)
                // save button
                Button(action: {
                    if let userValue = Double(dataManager.userInput) {
                        dataManager.itemtotal += userValue
                        dataManager.addToToplam(deger: userValue)
                        dataManager.itemtargetProgress = dataManager.itemtotal / Double(dataManager.userTarget)!

                        if dataManager.itemtotal >= Double(dataManager.userTarget)! && dataManager.itemtargetProgress >= 1 {
                            dataManager.itemtotal = 0
                        }
                        dataManager.userInput = ""
                        dataManager.saveData()
                    }
                }) {
                    Text("Save")
                        .padding()
                        .font(.title3)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .onAppear {
                dataManager.loadData()
            }
    }
}
#Preview {
    PlusView()
}
