//
//  AppDelegate.swift
//  Week5_ToiletInsideGate
//
//  Created by 정현준 on 2021/10/10.
//

import UIKit

// MARK: 소셜 로그인 SDK import
// 카카오
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

// 구글
import GoogleSignIn
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // MARK: 초기화 소셜 로그인 SDK 코드 추가
        // 카카오
        KakaoSDKCommon.initSDK(appKey: "d30cd816a76803c24e123c0ee34d1ede")

        // 구글: 사용자의 로그인 복원 시도
        FirebaseApp.configure()

        GIDSignIn.sharedInstance()?.clientID = "736397589065-1fqhm5i6f2hsnl3ehvfvaa8koikcgpvh.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self

        return true
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("User email: \(user.profile.email ?? "No Email")")
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Disconnected!")
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        // MARK: 소셜 로그인 설정
        // 카카오
        if (AuthApi.isKakaoTalkLoginUrl(url)) { // 카카오: info.plist에서 카카오톡 앱 실행 허용 -> 카카오톡에서 로그인 -> 이 앱으로 돌아왔을 떄 카카오톡 로그인 정상적으로 완료 (handleOpenUrl)
            return AuthController.handleOpenUrl(url: url)
        } else { // 카카오톡 외의 나머지 경우: 구글
            return GIDSignIn.sharedInstance().handle(url)
        }
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}


