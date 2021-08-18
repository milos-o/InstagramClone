//
//  StorageManager.swift
//  Instagram
//
//  Created by Amplitudo on 16.8.21..
//

import FirebaseStorage

public class StorageManager{
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
   public enum IGStorageManagerError: Error{
        case failedToDownload
    }
    
    
    public func uploadUserPost(model: UserPost, completion: (Result<URL, Error>) -> Void){
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void){
        bucket.child(reference).downloadURL { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        }
    }
    
}

