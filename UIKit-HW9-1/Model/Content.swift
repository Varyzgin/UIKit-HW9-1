//
//  Content.swift
//  UIKit-HW9-1
//
//  Created by Дима on 12/15/24.
//

import Foundation

struct Content {
    let authorNameText: String
    let profileImageName: String
    let posterImageName: String
    let date: String
    let headerText: String
    let descriptionText: String
    
    public static func data() -> [Content] {
        [
            Content( authorNameText: "Dmitry", profileImageName: "picture1", posterImageName: "poster1", date: "31.12.1924", headerText: "New photo", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in"),
            Content( authorNameText: "Nobody", profileImageName: "picture2", posterImageName: "photo2", date: "23.09.2012", headerText: "I believe", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in"),
            Content( authorNameText: "Nobody 2", profileImageName: "picture3", posterImageName: "poster2", date: "05.04.2008", headerText: "I can fly", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in")
        ]
    }
}
