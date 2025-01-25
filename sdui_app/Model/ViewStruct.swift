//
//  ViewStruct.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 23/01/25.
//

import Foundation

// MARK: - ViewStruct
struct ViewStruct: Codable {
    let screen: Screen
}

// MARK: - Screen
struct Screen: Codable {
    let id, title: String
    let components: [Component]
}

// MARK: - Component
struct Component: Codable {
    let type, id: String
    let value: String?
    let style: Style?
    let name: String?
}

// MARK: - Style
struct Style: Codable {
    let color, textAlignment, bold: String
}
