//
//  VideoRowViewModel.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//

import Foundation
import SwiftUI

struct VideoRowViewModel: Identifiable {
    private let item: LessonsResponse.LessonItem
    
    var id: Int {
        return item.id
    }
    
    var title: String {
        return item.name
    }
    
    var thumbnail: String {
        return item.thumbnail
    }
    
    init(item: LessonsResponse.LessonItem) {
        self.item = item
    }
}
