//
//  DataManager.swift
//  FinanceSave
//
//  Created by yusuf on 16.12.2023.
//

import Foundation

class DataManager: ObservableObject {
    @Published var itemtotal: Double = 0.0
    @Published var itemtargetProgress: Double = 0.0
    @Published var userInput: String = ""
    @Published var itemHedef: Double = 0.0
    @Published var totalMoney: Double = 0.0
    @Published var userTarget: String = ""
    @Published var remaining: Double = 0.0
    @Published var purpose : String = ""
    var userInputs : [String] = []
    
    
    // addToToplam fonksiyonunu güncelleyin
    func addToToplam(deger: Double) {
        totalMoney += Double(userInput)!
        userInputs.append(userInput)
        remaining = Double(userTarget)! - itemtotal
        itemtargetProgress = itemtotal / Double(userTarget)!
    }
    
    // saveData fonksiyonunu güncelleyin
    func saveData() {
        let savedData = SavedData(totalMoney: totalMoney, itemtotal: itemtotal, date: Date(), userInputs: userInputs, remaining: remaining,userTarget: userTarget, purpose: purpose, itemtargetProgress: itemtargetProgress)
        if let encodedData = try? JSONEncoder().encode(savedData) {
            UserDefaults.standard.set(encodedData, forKey: "savedData")
        }
    }
    
    // loadData fonksiyonunu güncelleyin
    func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "savedData") {
            if let decodedData = try? JSONDecoder().decode(SavedData.self, from: savedData) {
                totalMoney = decodedData.totalMoney
                itemtotal = decodedData.itemtotal
                userInput = "" // yeni girdi için sıfırlayın
                userInputs = decodedData.userInputs
                purpose = decodedData.purpose
                userTarget = decodedData.userTarget
                remaining = decodedData.remaining
                itemtargetProgress = decodedData.itemtargetProgress
            }
        }
    }
    
    // SavedData yapısını güncelleyin
    struct SavedData: Codable {
        var totalMoney: Double
        var itemtotal: Double
        var date: Date
        var userInputs: [String]
        var remaining: Double
        var userTarget: String
        var purpose : String
        var itemtargetProgress: Double
    }
}
