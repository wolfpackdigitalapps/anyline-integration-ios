//
//  ScanViewController.swift
//  AnylineTestPods
//
//  Created by Dan Ilies on 21/05/2019.
//  Copyright © 2019 Wolfpack-Digital. All rights reserved.
//

import UIKit
import Anyline

class ScanViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var scanResultLabel: UILabel!
    
    var scanPlugin: ALAbstractScanPlugin!
    var scanViewPlugin: ALAbstractScanViewPlugin!
    var scanView: ALScanView!
    var delegate: ALDelegate?
    
    var scanType: ScanType!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard scanType != nil else {
            print("ScanType not initialized")
            return
        }
        self.title = scanType.title
        self.setScanData()
        
        self.view.addSubview(self.scanView);
        self.scanView.startCamera();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        try? scanViewPlugin.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        try? scanViewPlugin.stop()
    }
    
    // MARK: - Private functions

    private func setScanData() {
        guard let scanData = ScanDataFactory.createScanData(type: scanType) else {
            print("Scan Data was not initialized")
            return
        }
        
        scanPlugin = scanData.scanPlugin
        scanViewPlugin = scanData.scanViewPlugin
        delegate = scanData.delegate
        delegate?.didFindResult = { [weak self] result in
            self?.scanResultLabel.text = result
        }
        
        scanView = ALScanView(frame: self.cameraView.frame, scanViewPlugin: scanViewPlugin)
    }
    
}
