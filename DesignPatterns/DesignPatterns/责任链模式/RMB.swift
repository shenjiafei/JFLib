//
//  RMB.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/2.
//

import Foundation

class RMB {
    class var standardWidth: Float {
        return 0
    }
    class var standardHeight: Float {
        return 0
    }
    
    var rmbValue: Double {
        return 0
    }
    
    final let width: Float
    final let height: Float
    
    required init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    
    convenience init() {
        let width = type(of: self).standardWidth
        let height = type(of: self).standardHeight
        self.init(width: width, height: height)
    }
}

extension RMB: CustomStringConvertible {
    var description: String {
        return "长：\(width)，宽：\(height)，面值：\(rmbValue)元"
    }
}

final class FiveYuan: RMB {
    
    override class var standardWidth: Float {
        return 135
    }
    override class var standardHeight: Float {
        return 63
    }
    override var rmbValue: Double {
        return 5
    }
}

final class TenYuan: RMB {
    
    override class var standardWidth: Float {
        return 140
    }
    override class var standardHeight: Float {
        return 70
    }
    override var rmbValue: Double {
        return 10
    }
}

final class TwentyYuan: RMB {
    
    override class var standardWidth: Float {
        return 145
    }
    override class var standardHeight: Float {
        return 70
    }
    override var rmbValue: Double {
        return 20
    }
}



//RMBHandlerProtocol
protocol RMBHandlerProtocol {
    var next: RMBHandlerProtocol? { get }
    func handleRMBValidation(_ unknownRMB: RMB) -> RMB?
}

final class RMBHandler: RMBHandlerProtocol {
    var next: RMBHandlerProtocol?
    let rmbType: RMB.Type
    let widthRange: ClosedRange<Float>
    let heightRange: ClosedRange<Float>
    
    init(rmbType: RMB.Type,
         widthTolerance: Float = 1,
         heightTolerance: Float = 1) {
        
        self.rmbType = rmbType
        
        let standardWidth = rmbType.standardWidth
        self.widthRange = (standardWidth - widthTolerance) ...
            (standardWidth + widthTolerance)
        
        let standardHeight = rmbType.standardHeight
        self.heightRange = (standardHeight - heightTolerance) ...
            (standardHeight + heightTolerance)
    }
}

extension RMBHandler {
    func handleRMBValidation(_ unknownRMB: RMB) -> RMB? {
        guard let rmb = createRMB(from: unknownRMB) else {
            return next?.handleRMBValidation(unknownRMB)
        }
        return rmb
    }
    
    private func createRMB(from unknownRMB: RMB) -> RMB? {
        print("尝试创建RMB：\(rmbType)")
        guard widthRange.contains(unknownRMB.width) else {
            print("长度不符合要求")
            return nil
        }
        guard heightRange.contains(unknownRMB.height) else {
            print("宽度不符合要求")
            return nil
        }
        let rmb = rmbType.init(width: unknownRMB.width,
                               height: unknownRMB.height)
        print("已创建纸币，\(rmb)")
        return rmb
    }
}

final class VendingMachine {
    
    private let rmbHandler: RMBHandler
    private(set) var rmbs: [RMB] = []
    
    init(rmbHandler: RMBHandler) {
        self.rmbHandler = rmbHandler
    }
    
    func insertRMB(_ unknownRMB: RMB) {
        guard let rmb = rmbHandler
            .handleRMBValidation(unknownRMB) else {
                print("无效的纸币")
                return
        }
        print("纸币已接收")
        rmbs.append(rmb)
        
        let totalValue = rmbs.reduce(0, { $0 + $1.rmbValue })
        print("已投币总金额：\(totalValue)元")
    }
}
