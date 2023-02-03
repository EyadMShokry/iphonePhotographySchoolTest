//
//  Responses.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//

import Foundation

struct LessonsResponse: Codable {
    let list: [LessonItem]
    
    struct LessonItem: Codable {
        let id: Int
        let title: String
        let description: String
        let thumbnail: String
        let video_url: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case description
            case thumbnail
            case video_url
        }
    }
}
