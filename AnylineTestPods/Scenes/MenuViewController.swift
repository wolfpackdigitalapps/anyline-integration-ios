//
//  MenuViewController.swift
//  AnylineTestPods
//
//  Created by Dan Ilies on 21/05/2019.
//  Copyright © 2019 Wolfpack-Digital. All rights reserved.
//

import UIKit

private let kScanSegueId = "ShowScanScene"

class MenuViewController: UIViewController {
    
    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    
    @IBAction func performMeterScan(_ sender: UIButton) {
        self.performSegue(withIdentifier: kScanSegueId, sender: ScanType.meter)
    }
    
    @IBAction func performIdScan(_ sender: UIButton) {
        self.performSegue(withIdentifier: kScanSegueId, sender: ScanType.id)
    }
    
    @IBAction func performBarcodeScan(_ sender: UIButton) {
        self.performSegue(withIdentifier: kScanSegueId, sender: ScanType.barcode)
    }
    
    @IBAction func performLicensePlateScan(_ sender: UIButton) {
        self.performSegue(withIdentifier: kScanSegueId, sender: ScanType.licensePlate)
    }
    
}

// MARK: - Navigation

extension MenuViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == kScanSegueId,
            let scanVC = segue.destination as? ScanViewController,
            let scanType = sender as? ScanType else { return }
        scanVC.scanType = scanType
    }
    
}
