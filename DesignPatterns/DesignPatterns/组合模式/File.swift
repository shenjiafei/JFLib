//
//  File.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/2.
//

import Foundation

protocol File {
    var name: String { get set }
    func open()
}

final class PDF: File {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func open() {
        print("正在打开\(name)")
    }
}

final class Music: File {
    var name: String
    var artist: String
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    
    func open() {
        print("正在播放\(artist)的\(name)")
    }
}

final class Folder: File {
    var name: String
    private(set) var files: [File] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addFile(_ file: File) {
        files.append(file)
    }
    
    func open() {
        print("\n")
        print("正在显示以下文件：")
        files.forEach { print("--- \($0.name)") }
    }
}
