//
//  LessonsFetcher.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//

import Foundation
import Combine

protocol LessonsFetchable {
    func lessonsList() -> AnyPublisher<LessonsResponse, LessonsError>
}

class LessonsFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - LessonsFetchable
extension LessonsFetcher: LessonsFetchable {
    func lessonsList() -> AnyPublisher<LessonsResponse, LessonsError> {
        return lessons(with: makeLessonsURLComponents(endpoint: "lessons"))
    }
    
    private func lessons<T>(
        with components: URLComponents
    ) -> AnyPublisher<T, LessonsError> where T: Decodable {
        guard let url = components.url else {
            let error = LessonsError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                    .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - OpenWeatherMap API
private extension LessonsFetcher {
    struct LessonsAPI {
        static let scheme = "https"
        static let host = "iphonephotographyschool.com"
        static let path = "/test-api/"
    }
    
    func makeLessonsURLComponents(endpoint: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = LessonsAPI.scheme
        components.host = LessonsAPI.host
        components.path = LessonsAPI.path + endpoint
        
        return components
    }
}
