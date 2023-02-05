//
//  VideosListView.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//
import SwiftUI

struct VideosListView: View {
    @ObservedObject var viewModel: VideosListViewModel
    
    init(viewModel: VideosListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    lessonsSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Lessons")
        }
    }
}

private extension VideosListView {
    var lessonsSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: VideoRow.init(viewModel:))
        }
    }
    
//    var cityHourlyWeatherSection: some View {
//        Section {
//            NavigationLink(destination: viewModel.currentWeatherView) {
//                VStack(alignment: .leading) {
//                    Text(viewModel.city)
//                    Text("Weather today")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//            }
//        }
//    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}
