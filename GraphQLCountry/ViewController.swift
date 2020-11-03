//
//  ViewController.swift
//  GraphQLCountry
//
//  Created by Amr Fawzy on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emo: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var native: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var capital: UILabel!
    
    var countryEmoji = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.shared.apollo.fetch(query: SpecificCountryQuery()) {result in
            switch result {
            case.success(let graphqlResult):
                DispatchQueue.main.async {
                if let emoji = graphqlResult.data?.country?.emoji {
                    self.emo.text = emoji
                }
                    self.capital.text = graphqlResult.data?.country?.capital
                    self.currency.text = graphqlResult.data?.country?.currency
                    self.native.text = graphqlResult.data?.country?.native
                    self.name.text = graphqlResult.data?.country?.name
                }
            case.failure(let error):
                print("Error is: \(error)")
            }
        }
    }


}

