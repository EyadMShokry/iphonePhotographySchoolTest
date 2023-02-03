//
//  LessonsError.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//

import Foundation

enum LessonsError: Error {
    case parsing(description: String)
    case network(description: String)
}
