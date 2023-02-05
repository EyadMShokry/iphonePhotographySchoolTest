//
//  VideosListViewModel.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//

import SwiftUI
import Combine

class VideosListViewModel: ObservableObject {
    @Published var dataSource: [VideoRowViewModel] = []
    
    private let lessonsFetcher: LessonsFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(
        lessonsFetcher: LessonsFetchable,
        scheduler: DispatchQueue = DispatchQueue(label: "VideosListViewModel")
    ) {
        self.lessonsFetcher = lessonsFetcher
        fetchLessons()
    }
    
    func fetchLessons() {
        lessonsFetcher.lessonsList()
            .map { response in
                response.lessons.map(VideoRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        print(value)
                        print("Failureee")
                        self.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] lessons in
                    guard let self = self else { return }
                    print("Lessons: ", lessons)
                    self.dataSource = lessons
                })
            .store(in: &disposables)
    }
}
