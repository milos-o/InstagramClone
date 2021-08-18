//
//  Models.swift
//  Instagram
//
//  Created by Amplitudo on 17.8.21..
//

import Foundation

public enum UserPostType{
    case photo, video
}

public enum Gender{
    case male, female, other
}

public struct UserPost{
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComments]
    let createdDate: Date
    let taggedUsers: [String]
}

struct Users {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount{
    let followers: Int
    let following: Int
    let posts: Int
}

struct PostLike{
    let username: String
    let postIdentifier: String
}

struct CommentLike{
    let username: String
    let commentIdentifier: String
}

struct PostComments{
    let identifer: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
