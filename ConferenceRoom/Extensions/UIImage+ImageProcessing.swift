import UIKit

extension UIImage {

    
//
////    func enchancedForOCR() -> UIImage {
////        var processedImage = findAndCropRect()
////        let textEnchanceFilter = TextEnchanceFilter()
////        processedImage = textEnchanceFilter.image(byFilteringImage: processedImage)
////        return processedImage
////    }
//    
//    func findAndCropRect() -> UIImage {
//        let featureOptions: [String: AnyObject] = [
//            CIDetectorImageOrientation: imageOrientation.rawValue as AnyObject,
//            CIDetectorAspectRatio: 0.3 as AnyObject,
//        ]
//        
//        let detectorOptions: [String: AnyObject] = [ CIDetectorAccuracy: CIDetectorAccuracyLow as AnyObject ]
//        let rectDetector =  CIDetector(ofType: CIDetectorTypeRectangle, context: nil, options: [ CIDetectorAccuracy: CIDetectorAccuracyLow])
////
//        let features = rectDetector?.features(in: ciImage, options: featureOptions)
//        if (features?.count)! > 0 {
//            let rectFeature = features?[0] as! CIRectangleFeature
//            ciImage = ciImage.correctPerspective(
//                bottomLeft: rectFeature.bottomLeft,
//                bottomRight: rectFeature.bottomRight,
//                topLeft: rectFeature.topLeft,
//                topRight: rectFeature.topRight)
//            return ciImage.makeUIImage()
//        }
//        return self
//    }
//
}

