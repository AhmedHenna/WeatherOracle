//
//  ResultsView.swift
//  WeatherOracle
//
//  Created by Ahmed Henna on 8/15/23.
//

import SwiftUI

struct ResultsView: View {
    @State var text = ""
    @State var showWeatherView = false
    @State var selectedIndex = 0
    @Namespace var namespace
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel = SearchViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    searchResults
                    Text(viewModel.cities.indices.contains(selectedIndex) ? viewModel.cities[selectedIndex].city : "")
                    .foregroundColor(.clear)                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
            }
            .searchable(text: $text, placement:
                    .navigationBarDrawer(displayMode: .always), prompt: Text("Cairo, London, New York")){
                        ForEach(viewModel.cities, id: \.self){ suggestion in
                            if text == "" {
                                Button {
                                    text = suggestion.city
                                } label:{
                                    Text(suggestion.city)
                                        .searchCompletion(suggestion.city)
                                }
                            }
                            
                        }
                    }
                    .navigationBarItems(trailing: Button {presentationMode.wrappedValue.dismiss()}
                                        label: {Text("Done").bold()})
        }
        .onAppear {
            viewModel.fetchCities(with: text)
        }
    }
    
    var searchResults: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.cities.indices, id: \.self) { index in
                    let item = viewModel.cities[index]
                    
                    if item.city.contains(text) || text.isEmpty {
                        if index != 0 {
                            Divider()
                        }
                        Button {
                            showWeatherView = true
                            selectedIndex = index
                        } label: {
                            HStack(alignment: .top, spacing: 15) {
                                Image("Sun")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 44, height: 44)
                                    .mask(RoundedRectangle(cornerRadius: 15))
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.city)
                                        .bold()
                                        .foregroundColor(.primary)
                                    Text(item.country)
                                        .font(.footnote)
                                        .lineLimit(3)
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding(.vertical, 5)
                            .listRowSeparator(.hidden)
                        }
                    }
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
