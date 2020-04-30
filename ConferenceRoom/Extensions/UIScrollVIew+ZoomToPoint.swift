import UIKit

extension UIScrollView {
    
    func zoomToPoint(_ zoomPoint: CGPoint, scale: CGFloat, animated: Bool) {
        let viewFrame = delegate!.viewForZooming!(in: self)!.bounds
        let newWidth  = viewFrame.width  / scale
        let newHeight = viewFrame.height / scale
        let newX = zoomPoint.x - newWidth / 2
        let newY = zoomPoint.y - newHeight / 2
        let zoomRect = CGRect(x:newX, y:newY, width:newWidth, height:newHeight)
        zoom(to: zoomRect, animated: animated)
    }
    
    func centerView() {
        let view = delegate!.viewForZooming!(in: self)!
        let boundsSize = bounds.size
        var contentsFrame = view.frame
        
        if contentsFrame.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0;
        }
        
        view.frame = contentsFrame;
        updateConstraintsIfNeeded()
//        setNeedsLayout()
        layoutIfNeeded()
    }

}
