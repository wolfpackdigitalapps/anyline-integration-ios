//
//  ALDelegate.swift
//  AnylineTestPods
//
//  Created by Dan Ilies on 21/05/2019.
//  Copyright © 2019 Wolfpack-Digital. All rights reserved.
//

import Foundation
import Anyline

// MARK: - Base Delegate class

class ALDelegate: NSObject {
    
    var didFindResult: ((String) -> ())?
    
}

// MARK: - Concrete delegate classes

class ALMeterDelegate: ALDelegate, ALMeterScanPluginDelegate {
    func anylineMeterScanPlugin(_ anylineMeterScanPlugin: ALMeterScanPlugin, didFind scanResult: ALMeterResult) {
        didFindResult?("Meter value detected:\n\n\(scanResult.result as String)")
    }
}

class ALIdDelegate: ALDelegate, ALIDPluginDelegate {
    func anylineIDScanPlugin(_ anylineIDScanPlugin: ALIDScanPlugin, didFind scanResult: ALIDResult<AnyObject>) {
        if let mrzResult = scanResult.result as? ALMRZIdentification {
            didFindResult?("ID Detected:\n\nGiven Names:\(mrzResult.givenNames ?? "") \nSurname:\(mrzResult.surname ?? "") \nDocument Number:\(mrzResult.documentNumber ?? "")")
        }
    }
}

class ALBarcodeDelegate: ALDelegate, ALBarcodeScanPluginDelegate {
    func anylineBarcodeScanPlugin(_ anylineBarcodeScanPlugin: ALBarcodeScanPlugin, didFind scanResult: ALBarcodeResult) {
        didFindResult?("Barcode detected:\n\n\(scanResult.result as String)")
    }
}

class ALLicensePlateDelegate: ALDelegate, ALLicensePlateScanPluginDelegate {
    func anylineLicensePlateScanPlugin(_ anylineLicensePlateScanPlugin: ALLicensePlateScanPlugin, didFind scanResult: ALLicensePlateResult) {
        didFindResult?("License Plate detected:\n\n\(scanResult.result as String)")
    }
}
