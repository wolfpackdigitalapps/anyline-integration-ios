//
//  ScanDataFactory.swift
//  AnylineTestPods
//
//  Created by Dan Ilies on 21/05/2019.
//  Copyright © 2019 Wolfpack-Digital. All rights reserved.
//

import Foundation
import Anyline

// MARK: - License Key

private let kAnylineKey = "eyJzY29wZSI6WyJBTEwiXSwicGxhdGZvcm0iOlsiaU9TIiwiQW5kcm9pZCIsIldpbmRvd3MiXSwidmFsaWQiOiIyMDE5LTA2LTE5IiwibWFqb3JWZXJzaW9uIjozLCJtYXhEYXlzTm90UmVwb3J0ZWQiOjUsInNob3dXYXRlcm1hcmsiOnRydWUsInBpbmdSZXBvcnRpbmciOnRydWUsImRlYnVnUmVwb3J0aW5nIjoib3B0LW91dCIsInRvbGVyYW5jZURheXMiOjUsInNob3dQb3BVcEFmdGVyRXhwaXJ5Ijp0cnVlLCJpb3NJZGVudGlmaWVyIjpbImNvbS53b2xmcGFjay5BbnlsaW5lIl0sImFuZHJvaWRJZGVudGlmaWVyIjpbImNvbS53b2xmcGFjay5BbnlsaW5lIl0sIndpbmRvd3NJZGVudGlmaWVyIjpbImNvbS53b2xmcGFjay5BbnlsaW5lIl19CmU5SzBtakpNTDJ1NStJVFpNekY4RnhLZGxnZ2ZMR0pud3VweUgrNWVwUHIxK0pZSkU3bzlyaUhUR3RuZE9IYy9XcE1wT0ZpcVBPRlV3KzZUWTN4M3hHZWU3TVpZOHZPVlY2Y1pjdlp1Q2FaU2FQQm9GZ0dTK3luYWNmQVZzd1Uzc015QUZ3TDJTRXdNZTNTMFRYV3I4bkpKREpsNFBPQU16YXpFTjBKQXl3Rm52bWU1Zi9rcjFXNGkxK29POENSMHJMM3J2UWlZSnJNWlNyR0FGN2p1UmxXenVjUUxyVkFUWUJpMXJKc0kvQ2hmeE1xWENmWmV4SFg5Sm9jTGtMOFcrbytZQ1VhY2dZalBucmw2ZERwQS94bENFajN0a0dLcERBUlJvcHJMdTNIdCtIQTBqb0F3Ty80TUpMNzBlUWFNRGtSbVFWSFNjWkJWMTNJWGg2dW0wZz09"

// MARK: - Scan related data

enum ScanType {
    case meter
    case id
    case barcode
    case licensePlate
    
    var title: String {
        switch self {
        case .meter: return "Meter Scan"
        case .id: return "ID Scan"
        case .barcode: return "Barcode Scan"
        case .licensePlate: return "License Plate Scan"
        }
    }
}

class ScanData {
    let scanPlugin: ALAbstractScanPlugin
    let scanViewPlugin: ALAbstractScanViewPlugin
    let delegate: ALDelegate
    
    init(scanPlugin: ALAbstractScanPlugin, scanViewPlugin: ALAbstractScanViewPlugin, delegate: ALDelegate) {
        self.scanPlugin = scanPlugin
        self.scanViewPlugin = scanViewPlugin
        self.delegate = delegate
    }
}

// MARK: - Factory

class ScanDataFactory {

    static func createScanData(type: ScanType) -> ScanData? {
        var scanPlugin: ALAbstractScanPlugin!
        var scanViewPlugin: ALAbstractScanViewPlugin!
        var delegate: ALDelegate!
        
        switch type {
        case .meter:
            delegate = ALMeterDelegate()
            scanPlugin = try! ALMeterScanPlugin(pluginID: "meter", licenseKey: kAnylineKey, delegate: delegate as! ALMeterScanPluginDelegate)
            scanViewPlugin = ALMeterScanViewPlugin(scanPlugin: scanPlugin as! ALMeterScanPlugin)!
        case .id:
            delegate = ALIdDelegate()
            scanPlugin = try! ALIDScanPlugin(pluginID: "id", licenseKey: kAnylineKey, delegate: delegate as! ALIDPluginDelegate, idConfig: ALMRZConfig.init())
            scanViewPlugin = ALIDScanViewPlugin(scanPlugin: scanPlugin as! ALIDScanPlugin)!
        case .barcode:
            delegate = ALBarcodeDelegate()
            scanPlugin = try! ALBarcodeScanPlugin(pluginID: "barcode", licenseKey: kAnylineKey, delegate: delegate as! ALBarcodeScanPluginDelegate)
            scanViewPlugin = ALBarcodeScanViewPlugin(scanPlugin: scanPlugin as! ALBarcodeScanPlugin)!
        case .licensePlate:
            delegate = ALLicensePlateDelegate()
            scanPlugin = try! ALLicensePlateScanPlugin(pluginID: "barcode", licenseKey: kAnylineKey, delegate: delegate as! ALLicensePlateScanPluginDelegate)
            scanViewPlugin = ALLicensePlateScanViewPlugin(scanPlugin: scanPlugin as! ALLicensePlateScanPlugin)!
        }
        
        return ScanData(scanPlugin: scanPlugin, scanViewPlugin: scanViewPlugin, delegate: delegate)
    }
}
