//
//  CameraOrPhotoPicker.swift
//

import SwiftUI
struct CameraOrPhotoPicker: UIViewControllerRepresentable {
    
    var completion: (UIImage) -> Void
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        #if targetEnvironment(simulator)
                picker.sourceType = .photoLibrary
        #else
                picker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        #endif
                picker.delegate = context.coordinator
                return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, completion: completion)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraOrPhotoPicker
        var completion: (UIImage) -> Void
        
        init(_ parent: CameraOrPhotoPicker, completion: @escaping (UIImage) -> Void) {
            self.parent = parent
            self.completion = completion
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                completion(image)
            }
            picker.presentingViewController?.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.presentingViewController?.dismiss(animated: true)
        }
    }
}

