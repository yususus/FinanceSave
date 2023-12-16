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
    @Published var hedef: Double = 5000.0
    @Published var userInput: String = ""
    @Published var itemHedef: Double = 0.0
    @Published var totalMoney: Double = 0.0
    @Published var userTarget: String = ""
    var userInputs : [String] = []
    
    
    // addToToplam fonksiyonunu güncelleyin
    func addToToplam(deger: Double) {
        totalMoney += Double(userInput)!
        userInputs.append(userInput)
        itemtargetProgress = itemtotal / hedef
    }
    
    // saveData fonksiyonunu güncelleyin
    func saveData() {
        let savedData = SavedData(totalMoney: totalMoney, itemtotal: itemtotal, date: Date(), userInputs: userInputs)
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
                itemtargetProgress = itemtotal / hedef
            }
        }
    }
    
    // SavedData yapısını güncelleyin
    struct SavedData: Codable {
        var totalMoney: Double
        var itemtotal: Double
        var date: Date
        var userInputs: [String]
    }
}
