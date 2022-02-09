//
//  LoginKakao.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/15.
//

import UIKit
import Alamofire
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginWithKakao {
    // MARK: 카카오톡 어플리케이션으로 로그인
    /**
     1. isKakaoTalkLoginAvailable() 으로 카카오톡 설치 여부 확인
     2. iOS SDK가 카카오톡 실행 -> 앱 이용관련 동의 구하는 화면 출력: API 호출시 결과 처리를 클로저 객체로 정의해 전달해야 함
     3. 사용자가 필수 항목에 동의하고 계속하기 선택 -> 카톡에서 이 앱으로 돌아와 인가 코드 및 토큰 발급 요청 -> 발급 성공시 카카오 로그인 완료
     */
    func loginToKakaoTalk() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error { // 카카오톡 어플리케이션 없는 경우 -> 카카오웹으로 로그인 유도
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    _ = oauthToken
                }
            }
        } else { // 카카오톡 어플리케이션 설치 안되어 있는 경우 -> 웹 로그인으로 우회시키기
            print("카카오톡 어플리케이션 미설치")
            self.loginWithKakaoWeb()
        }
    }
    // MARK: 카카오 웹으로 로그인
    func loginWithKakaoWeb() {
        UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                _ = oauthToken
            }
        }
    }

    // MARK: 기존 로그인 여부와 상관없이 로그인 요청
    func loginRegardlessIsLogin() {
        UserApi.shared.loginWithKakaoAccount(prompts: [.Login]) { (oauthToken, error )in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() Sucees.")
                _ = oauthToken
            }
        }
    }

    // MARK: 토큰 존재 여부 확인
    func hasToken() {
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    // 토큰값이 invalid -> 로그인 실행
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true {
                        self.loginToKakaoTalk()
                    } else {
                        // 다른 상황의 경우 해당 오류 출력
                        print(error.localizedDescription)
                    }
                } else { // accessTokenInfo가 오류 없는 경우: 토큰 유효성 체크 성공
                    print("hasToken() .success")
                }
            }
        } else { // hasToken = false인 경우 -> 로그인 필요
            self.loginToKakaoTalk()
        }
    }

    // MARK: 카카오 계정 로그아웃
    /**
     1. 토큰 삭제 -> 사용자 정보로 카카오 API 호출 못하게
     2. UserApi의 logout()으로 요청
     3.** 주의: API 요청 성공 여부과 관계 없이 토큰 삭제함** */
    func logoutFromKakao() {
        UserApi.shared.logout { (error) in
            if let error = error{
                print(error)
            } else {
                print("logout() success.")
            }
        }
    }

    // MARK: 연결 끊어버리기
    /**
     1. 카카오 플랫폼 안에서 앱과 사용자 카카오 계정의 연결 상태 해제
     2. 연결이 끊어지면 기존의 토큰은 더이상 사용 불가능 -> 로그아웃이 함께 이뤄짐!*/
    func unlinkFromKakao() {
        UserApi.shared.unlink { (error) in
            if let error = error {
                print(error)
            } else {
                print("unlink() success.")
            }
        }
    }
}
