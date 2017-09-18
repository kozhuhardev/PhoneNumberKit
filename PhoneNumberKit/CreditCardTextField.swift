//
//  CreditCardTextField.swift
//  PhoneNumberKit
//
//  Created by Igor A. Nikitin on 18.09.17.
//  Copyright © 2017 Roy Marmelstein. All rights reserved.
//

import UIKit

public final class CreditCardTextField: PhoneNumberTextField {
    
    // MARK: - Types
    
    public enum ContentType {
        case number
        case validDate
    }
    
    // MARK: - Properties
    
    public var contentType = ContentType.number {
        didSet {
            didUpdateContentType()
        }
    }
    
    // MARK: - Overrides
    
    override func setup() {
        super.setup()
        
        withPrefix = false
        didUpdateContentType()
    }
    
    // MARK: - Private
    
    private func didUpdateContentType() {
        defaultRegion = contentType.id
        maxDigits = contentType.maximumDigits
    }
}

// MARK: - Private extensions

private extension CreditCardTextField.ContentType {
    var id: String {
        switch self {
        case .number:
            return "CARD"
            
        case .validDate:
            return "CARDDATE"
        }
    }
    
    var maximumDigits: Int {
        switch self {
        case .number:
            return 19
            
        case .validDate:
            return 4
        }
    }
}
