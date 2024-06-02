//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by aman on 22/05/24.
//

import SwiftUI

struct BarcodeScanner: View {
    var body: some View {
        NavigationView {
            VStack {
                ScannerView()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 30)
                
                Text("\(Image(systemName: "barcode.viewfinder")) Scanned Barcode:")
                    .padding()
                    .font(.title)
                    .foregroundColor(Color(.darkGray))
                
                
                Text("Not Yet Scanned")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScanner()
}
