//
//  AuthManager.swift
//  Instagram
//
//  Created by Amplitudo on 16.8.21..
//

import FirebaseAuth

public class AuthManager{
    static let shared = AuthManager()
    
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard result != nil, error == nil else{
                        // firebase auth failed
                        completion(false)
                        return
                    }
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                        
                    }
                }
            } else {
                // either username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)){
        if let email = email {
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }else if let username = username {
            // username login
            print(username)
        }
    }
    
    public func logOut(completion: (Bool) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
    
}
