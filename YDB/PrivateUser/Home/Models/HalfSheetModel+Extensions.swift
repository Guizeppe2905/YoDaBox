//
//  Model+Extensions.swift
//  15 cacao
//
//  Created by Мария Хатунцева on 20.05.2022.
//

import SwiftUI

extension View {
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,
                                    @ViewBuilder sheetView: @escaping ()->SheetView) -> some View {
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet))
    }
}
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var showSheet: Bool
    let controller = UIViewController()
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            let sheetController = CustomHostingController(rootView: sheetView)
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}
class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
            presentationController.prefersGrabberVisible = true
        }
    }
}


