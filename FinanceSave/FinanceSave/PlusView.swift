//
//  PlusView.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import SwiftUI

struct PlusView: View {
    @StateObject private var dataManager = DataManager()

    func newFocus() {
        if dataManager.itemtotal >= dataManager.hedef {
            dataManager.itemtotal = 0
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Hedef: 5000")
                    .font(.title)
                CircleProgress(progress: dataManager.itemtargetProgress, total: dataManager.itemtotal)
                    .frame(width: Const.width * 0.7, height: Const.height * 0.35)
                Spacer()

                // number input
                TextField("Birikim Ekleyin ", text: $dataManager.userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding().frame(width: 250)

                // save button
                Button(action: {
                    if let userValue = Double(dataManager.userInput) {
                        dataManager.itemtotal += userValue
                        dataManager.addToToplam(deger: userValue)
                        dataManager.itemtargetProgress = dataManager.itemtotal / dataManager.hedef

                        if dataManager.itemtotal >= dataManager.hedef && dataManager.itemtargetProgress >= 1 {
                            dataManager.itemtotal = 0
                        }

                        dataManager.userInput = ""
                        dataManager.saveData()
                    }
                    print("Kullanıcı girdisi: *******************")
                    print("tebrikler tamamlandı")
                    print("ilerleme yüzdesi: \(dataManager.itemtargetProgress)")
                    print("toplam deger \(dataManager.itemtotal)")
                }) {
                    Text("Save")
                        .padding()
                        .font(.title3)
                        .background(Color.mint)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .navigationTitle("Biriktilen Tutar")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                dataManager.loadData()
            }
        }
    }
}

struct CircleProgress: View {
    let progress: Double
    let total: Double

    var body: some View {
        ZStack {
            Text("TOPLAM BİRİKİM: \(total, specifier: "%.2f")")
                .frame(width: 150, alignment: .center)
                .padding()
                .overlay(
                    Circle()
                        .stroke(
                            Color.red.opacity(0.3), lineWidth: 20
                        )
                        .frame(width: Const.width * 0.7, height: Const.height * 0.35)
                )
            // 2
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.mint,
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round,
                        lineJoin: .miter
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.spring, value: progress)
        }
    }
}

#Preview {
    PlusView()
}
