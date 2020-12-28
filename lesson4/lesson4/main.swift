//
//  main.swift
//  lesson4
//
//  Created by u on 28.12.2020.
//

import Foundation

enum MarkAuto {
    case toyota
    case kia
    case scania
    case kamaz
}
enum WindowState: String {
    case open = "Открыты"
    case closed = "Закрыты"
}

enum EngineState {
    case start
    case down
}

enum Nitro {
    case oneBallon, twoBallon, none
}
enum TrunkType {
    case open, closed
}

class Car {
    var mark: MarkAuto
    var windowState: WindowState
    var engineState: EngineState
    var usedTrunk: Double
    
    init(mark: MarkAuto, windowState: WindowState, engineState: EngineState, usedTrunk: Double) {
        self.mark = mark
        self.windowState = windowState
        self.engineState = engineState
        self.usedTrunk = usedTrunk
    }
    
    func useWindow(action: WindowState) {
            switch action {
            case .open:
                windowState = .open
                print("\(mark) windows is \(windowState)")
            case .closed:
                windowState = .closed
                print("\(mark) windows is \(windowState)")
            }
    }
}

class SportCar: Car {
    var nitro: Nitro
    
    init(mark: MarkAuto, windowState: WindowState, engineState: EngineState, usedTrunk: Double, nitro: Nitro) {
        self.nitro = nitro
        super.init(mark: mark, windowState: windowState, engineState: engineState, usedTrunk: usedTrunk)
    }
    
    func changeNitro(change: Nitro) {
        switch change {
        case .none:
            nitro = .none
        case .oneBallon:
            nitro = .oneBallon
        case .twoBallon:
            nitro = .twoBallon
        }
    }
    
    func sportCarInfo(){
        print(mark, windowState, engineState, usedTrunk, nitro)
    }
}

class TrunkCar: Car {
    var trunkType: TrunkType
    
    init(mark: MarkAuto, windowState: WindowState, engineState: EngineState, usedTrunk: Double, trunkType: TrunkType) {
        self.trunkType = trunkType
        super.init(mark: mark, windowState: windowState, engineState: engineState, usedTrunk: usedTrunk)
    }
    
    func changeTrunkType(change: TrunkType) {
        switch change {
        case .closed:
            trunkType = .closed
        case .open:
            trunkType = .open
        }

    }
    func trunkCarInfo(){
        print(mark, windowState, engineState, usedTrunk, trunkType)
    }
    
}

let toyota = SportCar(mark: .toyota, windowState: .open, engineState: .start, usedTrunk: 100, nitro: .twoBallon)
let kia = SportCar(mark: .kia, windowState: .closed, engineState: .down, usedTrunk: 200, nitro: .none)
let scania = TrunkCar(mark: .scania, windowState: .closed, engineState: .down, usedTrunk: 1500, trunkType: .closed)
let kamaz = TrunkCar(mark: .kamaz, windowState: .open, engineState: .down, usedTrunk: 800, trunkType: .open)

kia.changeNitro(change: .oneBallon)
kia.sportCarInfo()
print(kia.mark, kia.nitro)

kamaz.changeTrunkType(change: .closed)
print(kamaz.mark, kamaz.trunkType)
scania.trunkCarInfo()

scania.useWindow(action: .open)
kia.useWindow(action: .open)
