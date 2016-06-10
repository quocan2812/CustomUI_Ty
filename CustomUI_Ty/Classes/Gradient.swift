//
//  Gradient.swift
//  Pods
//
//  Created by Phan An on 6/10/16.
//
//

import UIKit

//update version 0.1.1

class Gradient: NSObject {

}
extension UITextField {
    
    @IBInspectable var localizedPlaceholder: String {
        get { return "" }
        set {
            self.placeholder = NSLocalizedString(newValue, comment: "")
        }
    }
    
    @IBInspectable var localizedText: String {
        get { return "" }
        set {
            self.text = NSLocalizedString(newValue, comment: "")
        }
    }
}

@IBDesignable class IbDesignTextField: UITextField {
    @IBInspectable var color : UIColor = UIColor.whiteColor(){
        didSet{
            setupView()
        }
    }
    @IBInspectable var insetText : CGFloat = 0.0{
        didSet{
            setupView()
        }
    }
    
    private func setupView(){
        self.backgroundColor = color
        
        self.leftViewMode = .Always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: insetText, height: insetText))
        
        self.setNeedsDisplay()
        
    }
    
    
    
}

@IBDesignable class BWGradientView: UIView {
    
    //MARK: Inspectable properties **************
    @IBInspectable var startColor : UIColor = UIColor.whiteColor(){
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor : UIColor = UIColor.blackColor(){
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false{
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness : CGFloat = 0.0{
        didSet{
            setupView()
        }
    }
    
    // MARK : Overrides **********************
    override class func layerClass() -> AnyClass{
        return CAGradientLayer.self
    }
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        setupView()
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //        setupView()
    //    }
    
    // Setup the view appearance
    private func setupView(){
        let color: Array = [startColor.CGColor, endColor.CGColor]
        
        gradientLayer.cornerRadius = roundness
        gradientLayer.colors = color
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }
        else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    // Help to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer{
        return layer as! CAGradientLayer
    }
    
}

