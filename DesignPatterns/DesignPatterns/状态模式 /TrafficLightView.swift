//
//  TrafficLightView.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation
import UIKit

final class TrafficLightView: UIView {

    // light container layers数组
    var lightContainerLayers: [CAShapeLayer] = []
    
    // 当前的状态
    private var currentState: TrafficLightState
    
    // 所有状态
    private var states: [TrafficLightState]

    // MARK: - Initializers

    init(frame: CGRect,
         lightsCount: Int = 3,
         states: [TrafficLightState]) {

        guard !states.isEmpty else { fatalError("states不能为空")}

        self.currentState = states.first!
        self.states = states
        super.init(frame: frame)

        backgroundColor = UIColor(red: 0.8, green: 0.6, blue: 0.3, alpha: 1)
        createLightContainerLayers(count: lightsCount)
        transition(to: currentState)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    // 下一个状态
    var nextState: TrafficLightState {
        guard let currentIndex = states.index(where: { $0 === currentState }),
            currentIndex + 1 < states.count else {
                return states.first!
        }
        return states[currentIndex + 1]
    }

    // 切换到指定的状态
    func transition(to state: TrafficLightState) {
        removeLightLayers()
        currentState = state
        currentState.apply(to: self)
        nextState.apply(to: self, after: currentState.delay)
    }

    // MARK: - Private

    // 创建light containers
    private func createLightContainerLayers(count: Int) {
        let yTotalPadding = 0.2 * frame.height
        let containerHeight = (frame.height - yTotalPadding) / CGFloat(count)

        let yPadding = yTotalPadding / CGFloat(count + 1)
        let xPadding = (frame.width - containerHeight) / 2.0

        var containerFrame = CGRect(x: xPadding,
                                   y: yPadding,
                                   width: containerHeight,
                                   height: containerHeight)

        for _ in 0 ..< count {
            let containerShape = CAShapeLayer()
            containerShape.path = UIBezierPath(ovalIn: containerFrame).cgPath
            containerShape.fillColor = UIColor.black.cgColor
            layer.addSublayer(containerShape)
            lightContainerLayers.append(containerShape)
            containerFrame.origin.y += (containerHeight + yPadding)
        }
    }
  
    // 移除所有light containers里面的light layers
    private func removeLightLayers() {
        lightContainerLayers.forEach {
            $0.sublayers?.forEach {
                $0.removeFromSuperlayer()
            }
        }
    }
}
