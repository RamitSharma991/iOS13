//
//  ViewController.swift
//  SwiftCodeSnippets
//
//  Created by Ramit sharma on 10/06/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameTimer: Timer?
    
    
    override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World"
        label.textColor = .black
        view.addSubview(label)
        self.view = view
        
        //Shadows, borders and cornerRadius
        let path = UIView()
        path.layer.cornerRadius = 10
        path.layer.backgroundColor = UIColor.blue.cgColor
        path.layer.borderWidth = 10
        path.layer.borderColor = UIColor.red.cgColor
        path.layer.shadowPath = UIBezierPath(rect: path.bounds).cgPath
        path.layer.shouldRasterize = true
        path.layer.rasterizationScale = UIScreen.main.scale
        
        
        //Timers for repeatetive actions
        gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        //object saves the property in it and the property calls/saves a func , therefore a strong refrence cycle means neither obj is freed.
       
        
        
        //trimming strings
        var str = "      Jonas Ferrer         "
        let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // string to Int conversion
        let myString = "7868"
        let myInt1 = Int(myString)
        let myInt2 = Int(myString) ?? 0
        let myInt3 = (myString as NSString).integerValue
        
        //Sorting Array using Sort()
        var names = ["coady","chippy","parry","kobe"]
        names.sort()
        
        //or
        
        struct User {
            var firstName: String
        }
        var users = [
            User(firstName: "coady"),
            User(firstName: "chippy"),
            User(firstName: "parry"),
            User(firstName: "kobe")

        ]
        users.sort {
            $0.firstName < $1.firstName
        }
        
        let sortedUsers = users.sorted {
            $0.firstName < $1.firstName
        }
        //adding strings
        
        var b1 = ["john", "paul"]
        var b2 = ["george", "ringo"]
        b1.append(contentsOf: b2)
        b1 += b2
        let b3 = b1 + b2
        
        //rounding off
        let decimal = 89.98980
        let formattedDecimal = String(format: "Decimal: %.2f", decimal)
        
        // Save user settings using UserDefaults
        let defaults = UserDefaults.standard
        defaults.set("Jake Rivers", forKey: "Name")
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "useTouchID")
        defaults.set(CGFloat.pi , forKey: "Pi")
        defaults.set(Date(), forKey: "Last Run")
        
        let array = ["Hello", "World" ]
        defaults.set(array, forKey: "Saved Array")
        
        let dict = ["Name": "Jake", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")
        
        let age = defaults.integer(forKey: "Age")
        let useTouchID = defaults.object(forKey: "UseTouchID")
        let pi = defaults.double(forKey: "Pi")
        
        let savedArray = defaults.object(forKey: "SAved Array") as? [String] ?? [String]()



        
         super.viewDidLoad()
    }
    @objc func runTimedCode() {
        //....
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameTimer?.invalidate()
        // to prevent the strong reference cycle
    }


}

class test: UIViewController {
    var username: String
    // Always give a initial default value to properties so the error Class has no iinitializers doesnt pop or do the following
    
    required init?(coder aDecoder: NSCoder) {
        self.username = "Terrible"
        super.init(coder: aDecoder)
    }
    


    
}

//loading remote Image URLs into UIimageView
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


class myTable: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
 //   }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.red
        return vw
    }
}


//tappable links in NSattributedStrings
class VWCNTRLR: UIViewController, UITextViewDelegate { // must have delegate
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let attributedString = NSMutableAttributedString(string: "C'est la Vest")
        attributedString.addAttribute(.link, value: "http://www.learnfrench.com", range: NSRange(location: 19, length: 55))
        textView.attributedText = attributedString

    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }

    
}
