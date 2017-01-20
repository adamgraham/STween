//
//  CALayer+Tweening.swift
//  STween
//
//  Created by Adam Graham on 1/18/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

extension CALayer: Tweenable {

    public enum TweenProperty {

        case frame(CGRect)
        case bounds(CGRect)

        case position(CGPoint)
        case zPosition(CGFloat)
        case anchorPoint(CGPoint)
        case anchorPointZ(CGFloat)

        case transform(CATransform3D)
        case sublayerTransform(CATransform3D)

        case contentsRect(CGRect)
        case contentsCenter(CGRect)
        @available(iOS 4.0, *)
        case contentsScale(CGFloat)

        case cornerRadius(CGFloat)
        case borderWidth(CGFloat)
        case borderColor(CGColor)
        case backgroundColor(CGColor)
        case opacity(Float)

        case shadowColor(CGColor)
        case shadowOpacity(Float)
        case shadowOffset(CGSize)
        case shadowRadius(CGFloat)

    }

    public func interpolationStartValue(for property: TweenProperty) -> TweenProperty {
        switch property {
        case .frame:
            return .frame(self.frame)
        case .bounds:
            return .bounds(self.bounds)

        case .position:
            return .position(self.position)
        case .zPosition:
            return .zPosition(self.zPosition)
        case .anchorPoint:
            return .anchorPoint(self.anchorPoint)
        case .anchorPointZ:
            return .anchorPointZ(self.anchorPointZ)

        case .transform:
            return .transform(self.transform)
        case .sublayerTransform:
            return .sublayerTransform(self.sublayerTransform)

        case .contentsRect:
            return .contentsRect(self.contentsRect)
        case .contentsCenter:
            return .contentsCenter(self.contentsCenter)
        case .contentsScale:
            return .contentsScale(self.contentsScale)

        case .cornerRadius:
            return .cornerRadius(self.cornerRadius)
        case .borderWidth:
            return .borderWidth(self.borderWidth)
        case .borderColor:
            return .borderColor(self.borderColor ?? UIColor.clear.cgColor)
        case .backgroundColor:
            return .backgroundColor(self.backgroundColor ?? UIColor.clear.cgColor)
        case .opacity:
            return .opacity(self.opacity)

        case .shadowColor:
            return .shadowColor(self.shadowColor ?? UIColor.clear.cgColor)
        case .shadowOpacity:
            return .shadowOpacity(self.shadowOpacity)
        case .shadowOffset:
            return .shadowOffset(self.shadowOffset)
        case .shadowRadius:
            return .shadowRadius(self.shadowRadius)
        }
    }

    public func interpolate(with ease: Ease, values: InterpolationValues<TweenProperty>,
                            elapsed: TimeInterval, duration: TimeInterval) throws {

        switch (values.start, values.end) {
        case let (.frame(startValue), .frame(endValue)):
            self.frame = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.bounds(startValue), .bounds(endValue)):
            self.bounds = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.position(startValue), .position(endValue)):
            self.position = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.zPosition(startValue), .zPosition(endValue)):
            self.zPosition = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.anchorPoint(startValue), .anchorPoint(endValue)):
            self.anchorPoint = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.anchorPointZ(startValue), .anchorPointZ(endValue)):
            self.anchorPointZ = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.transform(startValue), .transform(endValue)):
            self.transform = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.sublayerTransform(startValue), .sublayerTransform(endValue)):
            self.sublayerTransform = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.contentsRect(startValue), .contentsRect(endValue)):
            self.contentsRect = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.contentsCenter(startValue), .contentsCenter(endValue)):
            self.contentsCenter = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.contentsScale(startValue), .contentsScale(endValue)):
            self.contentsScale = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.cornerRadius(startValue), .cornerRadius(endValue)):
            self.cornerRadius = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.borderWidth(startValue), .borderWidth(endValue)):
            self.borderWidth = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.borderColor(startValue), .borderColor(endValue)):
            self.borderColor = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.backgroundColor(startValue), .backgroundColor(endValue)):
            self.backgroundColor = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.opacity(startValue), .opacity(endValue)):
            self.opacity = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.shadowColor(startValue), .shadowColor(endValue)):
            self.shadowColor = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.shadowOpacity(startValue), .shadowOpacity(endValue)):
            self.shadowOpacity = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.shadowOffset(startValue), .shadowOffset(endValue)):
            self.shadowOffset = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.shadowRadius(startValue), .shadowRadius(endValue)):
            self.shadowRadius = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        default:
            throw TweenError.invalidInterpolation(valueA: values.start, valueB: values.end, tweenable: self)
        }
    }

}
