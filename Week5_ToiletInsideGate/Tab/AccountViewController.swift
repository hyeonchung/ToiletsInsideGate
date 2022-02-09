//
//  AccountViewController.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/12.
//

import UIKit
import GoogleSignIn

class AccountViewController: UIViewController {
    let kakaoLogin = LoginWithKakao()

    @IBOutlet weak var AccountInfoView: UIView!
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var kakaoLoginIcon: UIButton!
    @IBOutlet weak var googleLoginIcon: GIDSignInButton!

    @IBAction func didKakaoLoginTapped(_ sender: UIButton) {
        print("카카오 로그인 버튼 클릭")
        kakaoLogin.loginToKakaoTalk()
    }

    @IBAction func moveToList(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MyListVC") as? MyListViewController else { return }
        present(vc, animated: true, completion: nil)
    }
}
