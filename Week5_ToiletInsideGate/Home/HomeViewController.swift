//
//  ViewController.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/10.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var upperTitle: UILabel!
    @IBOutlet weak var lowerTitle: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var myAccountButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func didNextButtonTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as? SearchViewController else {return}
        present(vc, animated: false, completion: nil)
    }
    @IBAction func didMyAccountButtonTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AccountVC") as? AccountViewController else { return }
        present(vc, animated: false, completion: nil)
    }
}

// 폰트 변경하는 함수
extension HomeViewController {
    func updateUI() {
        let font: UIFont = UIFont(name: "BM EULJIRO", size: 60)!
        changeFont(targetString: upperTitle, font: font)
        changeFont(targetString: lowerTitle, font: font)
        nextButton.layer.cornerRadius = 20
        myAccountButton.layer.cornerRadius = 20
    }

    func changeFont(targetString: UILabel, font: UIFont) {
        let fullText = targetString.text
        let attributedString = NSMutableAttributedString(string: fullText!)
        attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: fullText!.count))
        targetString.attributedText = attributedString
    }
}
