//
//  CodeGeneratorViewController.swift
//  BarcodeGenerator
//
//  Created by Maha on 17/12/2018.
//  Copyright © 2018 Maha. All rights reserved.
//

import UIKit
import CoreImage

class BarCodeGeneratorViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = CIQRCodeGenerator(from: "iOSDevTips://Hello World!")
    }
    
    // Generating bar code
    func CIQRCodeGenerator(from string : String) -> UIImage? {
        let data = string.data(using: .ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            if let outputCIImage = filter.outputImage {
                let scaleX = imageView.frame.size.width / outputCIImage.extent.width
                let scaleY = imageView.frame.size.height / outputCIImage.extent.height
                let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
                
                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
                
            }
        }
        return nil
    }
}


