//
//  JXSegmentedCollectionView.swift
//  JXSegmentedView
//
//  Created by jiaxin on 2018/12/26.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

open class JXSegmentedCollectionView: UICollectionView {
    var bringSubviewToFront: Bool = false

    open var indicators = [JXSegmentedIndicatorProtocol]() {
        willSet {
            for indicator in indicators {
                indicator.removeFromSuperview()
            }
        }
        didSet {
            for indicator in indicators {
                addSubview(indicator)
            }
        }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        for indicator in indicators {
            if bringSubviewToFront {
                bringSubviewToFront(indicator)
            } else {
                sendSubviewToBack(indicator)
            }
            if let backgroundView = backgroundView {
                sendSubviewToBack(backgroundView)
            }
        }
    }
}
