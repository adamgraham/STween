//
//  ViewController.swift
//  STweenExample
//
//  Created by Adam Graham on 7/10/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import UIKit
import STween

class ViewController: UIViewController {

    // MARK: Life Cycle

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Defaults.overshoot /= 2.0
        Defaults.frameRate = 30.0
    }

    // MARK: IBOutlets

    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var titleTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var subtitleLeadingConstraint: NSLayoutConstraint!

    @IBOutlet private weak var animateButton: UIButton! {
        didSet {
            self.animateButton.layer.cornerRadius = 25.0
            self.animateButton.layer.borderWidth = 1.0
            self.animateButton.layer.borderColor = self.animateButton.titleColor(for: .normal)?.cgColor
        }
    }

    @IBOutlet private weak var backgroundCircularView: UIView! {
        didSet {
            self.backgroundCircularView.layer.cornerRadius = 0.5
        }
    }

    @IBOutlet private weak var backgroundOverlayView: UIView! {
        didSet {
            self.backgroundOverlayView.isHidden = true
            self.backgroundOverlayView.alpha = 0.0
        }
    }

    @IBOutlet private weak var purchaseModalYConstraint: NSLayoutConstraint!
    @IBOutlet private weak var purchaseModalView: UIView! {
        didSet {
//            self.purchaseModalView.layer.shadowColor = UIColor.black.cgColor
//            self.purchaseModalView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//            self.purchaseModalView.layer.shadowRadius = 5.0
//            self.purchaseModalView.layer.shadowOpacity = 0.35
//            self.purchaseModalView.layer.shadowPath = UIBezierPath(rect: self.purchaseModalView.bounds).cgPath
            self.purchaseModalView.layer.cornerRadius = 10.0
        }
    }

    @IBOutlet private weak var purchaseButton: UIButton! {
        didSet {
            self.purchaseButton.layer.cornerRadius = 25.0
            self.purchaseButton.layer.borderWidth = 1.0
            self.purchaseButton.layer.borderColor = self.purchaseButton.titleColor(for: .normal)?.cgColor
        }
    }

    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var successView: UIView!

    // MARK: IBActions

    @IBAction private func didTapAnimateButton(_ sender: UIButton) {
        hideMainMenu()
        showPurchaseModal(delay: 0.35)
    }

    @IBAction private func didTapBuyButton(_ sender: UIButton) {
        showLoadingView()
        hidePurchaseModal()
        showSuccessView(delay: 5.0)
        hideSuccessView(delay: 7.5)
        showMainMenu(delay: 9.0)
    }

    // MARK: Animations

    private func showMainMenu(delay: Double) {
        (self.animateButton as UIView).tween(to: UIViewTweenProperty.alpha(1.0), duration: 0.75)
            .set(callback: { self.animateButton.isEnabled = true }, for: .complete)
            .set(delay: delay)

        self.titleTrailingConstraint.tween(to: NSLayoutConstraintTweenProperty.constant(0.0), duration: 0.6)
            .set(ease: .backOut)
            .set(delay: delay)

        self.subtitleLeadingConstraint.tween(to: NSLayoutConstraintTweenProperty.constant(0.0), duration: 0.6)
            .set(ease: .backOut)
            .set(delay: delay)
    }

    private func hideMainMenu() {
        (self.animateButton as UIView).tween(to: UIViewTweenProperty.alpha(0.0), duration: 0.5)
            .set(callback: { self.animateButton.isEnabled = false }, for: .start)

        self.titleTrailingConstraint.tween(to: NSLayoutConstraintTweenProperty.constant(-1000.0), duration: 0.6)
            .set(ease: .backIn)

        self.subtitleLeadingConstraint.tween(to: NSLayoutConstraintTweenProperty.constant(-1000.0), duration: 0.6)
            .set(ease: .backIn)
    }

    private func showPurchaseModal(delay: Double) {
        self.backgroundOverlayView.isHidden = false
        self.backgroundOverlayView.tween(to: UIViewTweenProperty.alpha(0.5), duration: 0.75)
            .set(delay: delay)

        self.purchaseModalYConstraint.tween(from: NSLayoutConstraintTweenProperty.constant(self.view.frame.height), duration: 0.65)
            .set(ease: .backOut)
            .set(delay: delay + 0.5)
            .set(callback: { self.purchaseModalView.isHidden = false }, for: .start)
    }

    private func hidePurchaseModal() {
        self.backgroundOverlayView.tween(to: UIViewTweenProperty.alpha(0.0), duration: 0.75)
            .set(delay: 0.5)
            .set(callback: { self.backgroundOverlayView.isHidden = true }, for: .complete)

        let originalPosition = self.purchaseModalYConstraint.constant
        self.purchaseModalYConstraint.tween(to: NSLayoutConstraintTweenProperty.constant(self.view.frame.height), duration: 0.65)
            .set(ease: .backIn)
            .set(callback: { self.purchaseModalView.isHidden = true
                             self.purchaseModalYConstraint.constant = originalPosition }, for: .complete)
    }

    private func showLoadingView() {
        self.loadingView.isHidden = false
    }

    private func hideLoadingView() {
        self.loadingView.isHidden = true
    }

    private func showSuccessView(delay: Double) {
        self.backgroundCircularView.layer.transform = CATransform3DIdentity
        let scale = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 1.5
        let scaleTransform = CATransform3DScale(self.backgroundCircularView.layer.transform, scale, scale, 1.0)
        self.backgroundCircularView.layer.tween(to: CALayerTweenProperty.transform(scaleTransform), duration: 0.75)
            .set(ease: .quadIn)
            .set(delay: delay)
            .set(callback: { self.backgroundCircularView.isHidden = false
                             self.backgroundCircularView.alpha = 1.0 }, for: .start)
            .set(callback: hideLoadingView, for: .complete)

        self.successView.isHidden = false
        self.successView.tween(to: UIViewTweenProperty.alpha(1.0), duration: 1.0)
            .set(delay: delay + 0.2)
    }

    private func hideSuccessView(delay: Double) {
        self.backgroundCircularView.tween(to: UIViewTweenProperty.alpha(0.0), duration: 1.0)
            .set(delay: delay)
            .set(callback: { self.backgroundCircularView.isHidden = true }, for: .complete)

        self.successView.tween(to: UIViewTweenProperty.alpha(0.0), duration: 0.75)
            .set(delay: delay)
            .set(callback: { self.successView.isHidden = true }, for: .complete)
    }

}
