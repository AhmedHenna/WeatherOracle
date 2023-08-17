import SwiftUI

struct ResultsView: View {
    @State var text = ""
    @State var selectedIndex = 0
    @Binding var populatedCities: [Forecast]
    @Namespace var namespace
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    searchResults
                    Text(viewModel.cities.indices.contains(selectedIndex) ? viewModel.cities[selectedIndex].city : "")
                        .foregroundColor(.clear)
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Cairo, London, Tokyo")) {
                ForEach(viewModel.cities, id: \.self) { suggestion in
                    if text == "" {
                        Button {
                            text = suggestion.city
                        } label: {
                            Text(suggestion.city)
                                .searchCompletion(suggestion.city)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Done").bold() })
        }
        .onAppear {
            viewModel.fetchCities(with: text)
        }
    }
    
    private func savePopulatedCities() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(populatedCities), forKey: "PopulatedCities")
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
                            selectedIndex = index
                            viewModel.fetchWeatherData(lat: Double(item.lat) ?? 0, lon: Double(item.lng) ?? 0)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                if let weatherData = viewModel.weatherData {
                                    let newItem = Forecast(date: .now,
                                                           weather: weatherData.current?.weather?.first?.description ?? "Clear",
                                                           probability: Int(weatherData.current?.rain?.value ?? 0),
                                                           temperature: Int(round(weatherData.current?.temp ?? 0)),
                                                           high: Int(round(weatherData.daily?.first?.temp?.max ?? 0)),
                                                           low: Int(round(weatherData.daily?.first?.temp?.min ?? 0)),
                                                           location: "\(item.city), \(item.country)",
                                                           icon: mapToIcon(id: weatherData.current?.weather?.first?.id ?? 0,
                                                                           time: TimeConverter.getTimeOfDay(currentTime:  weatherData.current?.dt ?? 1,
                                                                                                            sunset: weatherData.current?.sunset ?? 1,
                                                                                                            sunrise: weatherData.current?.sunrise ?? 1,
                                                                                                            offset: weatherData.timezoneOffset ?? 1)))
                                    
                                    if !populatedCities.contains(where: { $0.location == newItem.location }) {
                                        populatedCities.append(newItem)
                                        savePopulatedCities()
                                    }
                                }
                            }
                        } label: {
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
                        .contextMenu {
                            Button("Delete") {
                                populatedCities.remove(at: index)
                                savePopulatedCities()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCities: [Forecast] = [
            Forecast(date: .now, weather: "", probability: 0, temperature: 0, high: 0, low: 0, location: "", icon: ""),
        ]
        
        let populatedCitiesBinding = Binding<[Forecast]>(get: { sampleCities }, set: { _ in })
        
        return ResultsView(populatedCities: populatedCitiesBinding)
    }
}
