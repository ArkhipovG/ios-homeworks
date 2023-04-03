//
//  Posts.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

struct Post {
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
                    autor: "Cat777",
                    description: "Meow!",
                    image: "cat",
                    likes: 125,
                    views: 280),

                Post(
                    autor: "Dog007",
                    description: "Smile!",
                    image: "dog",
                    likes: 345,
                    views: 520),

                Post(
                    autor: "MonkeyBusiness",
                    description: "We are different!",
                    image: "monkey",
                    likes: 777,
                    views: 80),
                Post(
                    autor: "Wombat",
                    description: "Combat wombat!",
                    image: "wombat",
                    likes: 28,
                    views: 75)
            ]
        }
    }


var posts: [Post] = [] 

let post = Post(title: "Мой первый пост")
let postViewController = PostViewController()
