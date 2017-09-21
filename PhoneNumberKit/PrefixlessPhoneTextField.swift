//
//  PrefixlessPhoneTextField.swift
//  PhoneNumberKit
//
//  Created by Igor A. Nikitin on 20.09.17.
//  Copyright © 2017 Roy Marmelstein. All rights reserved.
//

import Foundation

open class PrefixlessPhoneTextField: PhoneNumberTextField {
    
    // MARK: - Properties
    
    public override var defaultRegion: String {
        didSet {
            updateMaximumDigitsCount()
        }
    }
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        withPrefix = false
        shouldAddPrefixBeforeNationalNumber = false
        updateMaximumDigitsCount()
    }
    
    // MARK: - Private
    
    private func updateMaximumDigitsCount() {
        maxDigits = partialFormatter.currentMetadata?.mobile?.maximumDigitsCount
    }
}
