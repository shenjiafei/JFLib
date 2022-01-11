//
//  Door.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/2.
//

import Foundation

final class Door {
    var isOpen = false
}

class DoorCommand {
    let door: Door
    init(door: Door) { self.door = door }
    func execute() {}
}

final class OpenCommand: DoorCommand {
    override func execute() {
        print("正在开门")
        door.isOpen = true
    }
}

final class CloseCommand: DoorCommand {
    override func execute() {
        print("正在关门")
        door.isOpen = false
    }
}

final class Doorman {
    let door: Door
    
    let closeCommand: CloseCommand
    let openCommand: OpenCommand
    
    init(door: Door) {
        closeCommand = CloseCommand(door: door)
        openCommand = OpenCommand(door: door)
        self.door = door
    }
    
    func closeDoor() {
        closeCommand.execute()
    }
    
    func openDoor() {
        openCommand.execute()
    }
}


