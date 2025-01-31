/// Copyright (c)
import SwiftUI

struct TripListView: View {
    @ObservedObject var presenter: TripListPresenter
    
    var body: some View {
        List {
            ForEach (presenter.trips, id: \.id) { item in
                TripListCell(trip: item)
                    .frame(height: 240)
            }
            .onDelete(perform: presenter.deleteTrip(_:))
        }
        .navigationBarTitle("Roadtrips", displayMode: .inline)
        .navigationBarItems(trailing: presenter.makeAddNewButton())
    }
}

#Preview {
    let model = DataModel.sample
    let interactor = TripListInteractor(model: model)
    let presenter = TripListPresenter(interactor: interactor)
    return NavigationView {
        TripListView(presenter: presenter)
    }
}


