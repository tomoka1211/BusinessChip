//
//  NfcTagViewController.swift
//  BusinessChip
//
//  Created by hirano_tomoka on 2019/06/26.
//  Copyright © 2019 hirano_tomoka. All rights reserved.
//

import UIKit
import CoreNFC

class NfcTagViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    //NFCタグ検証用。削除予定
    @IBOutlet weak var tryNfcTV: UITextView!
    
    
    var session: NFCNDEFReaderSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = NFCNDEFReaderSession(delegate: self,
                                       queue: nil,
                                       invalidateAfterFirstRead: true)
        session.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                if let type = String.init(data: record.type, encoding: .utf8) {
                    print("type: \(type)")
                }
                if let identifier = String.init(data: record.identifier, encoding: .utf8) {
                    print("identifier: \(identifier)")
                }
                if let payload = String.init(data: record.payload, encoding: .utf8) {
                    print("payload: \(payload)")
                    self.tryNfcTV.text = payload
                }
            }
        }
    }
    
    public func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print(#function, error)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
