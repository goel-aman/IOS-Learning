//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by aman on 01/06/24.
//

import SwiftUI

struct   : UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
         Coordinator()  
    }
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
     
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
        
        
    }
    
}

#Preview {
    ScannerView()
}
