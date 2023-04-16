//
//  Posts.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

struct Post {
    
    let postID: Int
    var autor: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

public class PostProvider {
    static func getPost() -> [Post] {
        [
            Post(
                postID: 0,
                autor: "Cat777",
                description: "Meow!",
                image: "cat",
                likes: 125,
                views: 280),
            
            Post(
                postID: 1,
                autor: "Dog007",
                description: "Smile!",
                image: "dog",
                likes: 345,
                views: 520),
            
            Post(
                postID: 2,
                autor: "MonkeyBusiness",
                description: "We are different!",
                image: "monkey",
                likes: 777,
                views: 80),
            Post(
                postID: 3,
                autor: "Wombat",
                description: "Combat wombat!",
                image: "wombat",
                likes: 28,
                views: 75)
        ]
    }
}



