//
//  VideoRow.swift
//  iPhonePhotographySchoolTest
//
//  Created by Eyad Shokry on 03/02/2023.
//

import SwiftUI

struct VideoRow: View {
    private let viewModel: VideoRowViewModel
    
    init(viewModel: VideoRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: viewModel.thumbnail),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100, maxHeight: 70)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text(viewModel.title)
            
            Spacer()

            Image(systemName: "chevron.forward")
                .foregroundColor(Color.blue)
        }
    }
}
