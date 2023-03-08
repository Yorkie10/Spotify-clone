//
//  AuthService.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 22.02.2023.
//

import FirebaseAuth
import FirebaseFirestore


final class AuthService {
    
    static let shared = AuthService()
    
    private init() { }
    
    func registerUser(with userRequest: RegistrationUserRequest, completion: @escaping (Bool, Error?) -> Void) {
        let userName = userRequest.userName
        let userEmail = userRequest.email
        let userPassword = userRequest.password
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "userName": userName,
                    "userEmail": userEmail
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
    }
    
    func signIn(with userRequest: RegistrationUserRequest, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
}
