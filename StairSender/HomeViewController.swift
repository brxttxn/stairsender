//
//  ViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/8/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        stairs.removeAll()
        retrieveDataFromDb();
        
        self.navigationController?.navigationBarHidden = true;
    }
    
    func retrieveDataFromDb() {
        self.ref = FIRDatabase.database().reference()
        ref.child("stairs").queryOrderedByChild("title").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let title = snapshot.value!["title"] as? String {
                stairs.append(["key": snapshot.key, "title": title]);
            }
        })
    }

}

