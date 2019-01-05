//
//  PlayingCardView.swift
//  PlayingCards
//
//  Created by Madhu Rimmalapudi on 1/4/19.
//  Copyright © 2019 Madhu Rimmalapudi. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    var rank = 5
    var suit = "♥️"
    var isFaceUp = true
    
    private var cornerString : NSAttributedString {
        return centeredAttributedString(rankString+"\n"+suit , setFont: cornerFontSize)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        path.addClip()
        UIColor.white.setFill()
        path.fill()
    }
    
    private func centeredAttributedString(_ string:String, setFont:CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(setFont)
        font = UIFontMetrics(forTextStyle:.body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle:paragraphStyle ,.font:font])
    }
    private lazy var upperLeftLable = createCornerLabel()
    private lazy var lowerRightLabel = createCornerLabel()
    
    private func createCornerLabel()->UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    private func configureLabel(label:UILabel) {
        label.attributedText = cornerString
        label.frame.size = CGSize.zero
        label.sizeToFit()
        label.isHidden = !isFaceUp
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLabel(label: upperLeftLable)
        upperLeftLable.frame.origin = bounds.origin.offSetBy(dx: cornerOffset, dy: cornerOffset)
        configureLabel(label: lowerRightLabel)
        lowerRightLabel.transform = CGAffineTransform.identity
            .translatedBy(x: lowerRightLabel.frame.size.width, y: lowerRightLabel.frame.height)
            .rotated(by: CGFloat.pi)
        lowerRightLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY)
            .offSetBy(dx: -cornerOffset, dy: -cornerOffset)
            .offSetBy(dx: -lowerRightLabel.frame.size.width, dy: -lowerRightLabel.frame.size.height)
    }
    

}
extension PlayingCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    private var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    private var rankString: String {
        switch rank {
        case 1:return "A"
        case 2...10: return String(rank)
        case 11:return "J"
        case 12:return "Q"
        case 13:return "k"
        default:return "?"
        }
    }
}
extension CGPoint {
    func offSetBy(dx:CGFloat, dy:CGFloat) -> CGPoint {
        return CGPoint(x:x+dx, y:y+dy)
    }
}
