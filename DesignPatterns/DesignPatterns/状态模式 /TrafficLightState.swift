//
//  TrafficLightState.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation
import UIKit

//亮灯协议 有 delay  和 apply方法
protocol TrafficLightState: class {
    var delay: TimeInterval { get }
    func apply(to context: TrafficLightView)
}

extension TrafficLightState {
    func apply(to context: TrafficLightView, after delay: TimeInterval) {
        DispatchQueue.main
            .asyncAfter(deadline: .now() + delay) { [weak self, weak context] in
                guard let strongSelf = self, let context = context else { return }
                context.transition(to: strongSelf)
        }
    }
}

//灯状态遵循亮灯协议
final class SolidTrafficLightState: TrafficLightState {
    let index: Int
    let color: UIColor
    let delay: TimeInterval

    init(index: Int, color: UIColor, delay: TimeInterval) {
        self.index = index
        self.color = color
        self.delay = delay
    }

    func apply(to context: TrafficLightView) {
        let containerLayer = context.lightContainerLayers[index]
        let lightShape = CAShapeLayer()
        lightShape.path = containerLayer.path
        lightShape.fillColor = color.cgColor
        lightShape.strokeColor = color.cgColor
        containerLayer.addSublayer(lightShape)
    }
}

// MARK: - Lights
extension SolidTrafficLightState {
    class func redLight(index: Int = 0,
                        color: UIColor = .red,
                        delay: TimeInterval = 10) -> SolidTrafficLightState {
        return SolidTrafficLightState(index: index, color: color, delay: delay)
    }

    class func yellowLight(index: Int = 1,
                           color: UIColor = .yellow,
                           delay: TimeInterval = 3) -> SolidTrafficLightState {
        return SolidTrafficLightState(index: index, color: color, delay: delay)
    }

    class func greenLight(index: Int = 2,
                          color: UIColor = .green,
                          delay: TimeInterval = 10) -> SolidTrafficLightState {
        return SolidTrafficLightState(index: index, color: color, delay: delay)
    }
}
