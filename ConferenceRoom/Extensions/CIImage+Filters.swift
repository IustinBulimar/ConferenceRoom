import CoreImage
import UIKit

extension CIImage {
    
    func applyAutoFilters() -> CIImage {
        let autoFilters = autoAdjustmentFilters(options: nil)
        var ciImage = self
        _ = autoFilters.map { filter in
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            ciImage = filter.outputImage!
        }
        return ciImage
    }
    
    /**
     - parameter saturation: Default value: 1.0
     - parameter constrast:  Default value: 1.0
     */
    func adjust(saturation: NSNumber = 1.0, brightness: NSNumber = 0, constrast: NSNumber = 1.0) -> CIImage {
        let inputParameters = [
            "inputSaturation": saturation,
            "inputBrightness": brightness,
            "inputContrast": constrast
        ]
        return applyingFilter("CIColorControls", parameters: inputParameters)
    }
    
    /**
     - parameter exposure: Default value: 0.5
     */
    func adjust(exposure: NSNumber = 0.5) -> CIImage {
        let inputParameters = [ "inputEV": exposure ]
        return applyingFilter("CIExposureAdjust", parameters: inputParameters)
    }
    
    /**
     - parameter gamma: Default value: 0.75
     */
    func adjust(gamma: NSNumber = 0.75) -> CIImage {
        let inputParameters = [ "inputPower": gamma ]
        return applyingFilter("CIGammaAdjust", parameters: inputParameters)
    }
    
    func applyPhotoNoir() -> CIImage {
        return applyingFilter("CIPhotoEffectNoir", parameters: [:])
    }
    
    func correctPerspective(bottomLeft: CGPoint, bottomRight: CGPoint, topLeft: CGPoint, topRight: CGPoint) -> CIImage {
        let inputParameters = [
            "inputTopLeft": CIVector(cgPoint: topLeft),
            "inputTopRight": CIVector(cgPoint: topRight),
            "inputBottomLeft": CIVector(cgPoint: bottomLeft),
            "inputBottomRight": CIVector(cgPoint: bottomRight)
        ]
        return applyingFilter("CIPerspectiveCorrection", parameters: inputParameters)
    }
    
    func correctPerspective(from rectFeature: CIRectangleFeature) ->CIImage {
        return correctPerspective(
            bottomLeft: rectFeature.bottomLeft,
            bottomRight: rectFeature.bottomRight,
            topLeft: rectFeature.topLeft,
            topRight: rectFeature.topRight)
    }
    
    func reduceNoise(noiseLevel: NSNumber = 0.02, sharpness: NSNumber = 0.4) -> CIImage {
        let inputParameters = [
            "inputNoiseLevel": noiseLevel,
            "inputSharpness": sharpness
        ]
        return applyingFilter("CINoiseReduction", parameters: inputParameters)
    }
    
    
    func enhanceBlackAndWhite() -> CIImage {
        var ciImage = self
        
        ciImage = ciImage.adjust(saturation: 0, brightness: 0.3, constrast: 2.2)
        ciImage = ciImage.adjust(exposure: 1)
        ciImage = ciImage.reduceNoise()
//        ciImage = ciImage.adjust(gamma: 1)
//        ciImage = ciImage.applyPhotoNoir()
        
        return ciImage
    }
    
    var uiImage: UIImage? {
        let context = CIContext(options: nil)
        if let cgImage = context.createCGImage(self, from: extent) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
    
}


