//
//  TargetView.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import SwiftUI

struct Targets: View {
    @StateObject private var dataManager = DataManager()
    var body: some View {
        VStack {
            Text("Hedef Belirleyin!")
                .font(.title3)
                .frame(width: Const.width * 0.5, height: Const.height * 0.05)
            TextField("🙂", text: $dataManager.userTarget).multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .frame(width: Const.width * 0.6)
            Spacer()
            HStack{
                Text("dasda")
            }
            Spacer()
        }.frame(width: Const.width * 0.9)
    }
}

#Preview {
    Targets()
}
