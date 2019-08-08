//
//  APIManager.swift
//  HttpScb
//
//  Created by Siripron Thammarakkitanon on 8/8/2562 BE.
//  Copyright © 2562 Siripron Thammarakkitanon. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    func getRandomJoke() {
        guard  let url = URL(string : "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random") else{
            return
        }
        // สร้างเสร็จ
        var request = URLRequest(url: url)
        // เซ็ตให้เป็น get
        request.httpMethod = "GET"
        request.setValue("d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5", forHTTPHeaderField: "x-rapidapi-key")
        // ได้ session เดียวกันเสมอ ทุกหน้าเเชร์ร่วมกัน
        let task = URLSession.shared.dataTask(with: request){
            (data , response ,error)in
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data{
                print(data)
            }
        }
        // คำสั่งรันจริงๆ
        task.resume()
}
    
    func getRandomJokeAlamofire() {
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5",
            "Accept": "application/json"
        ]
        Alamofire.request("https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random", headers: headers).responseJSON { (data) in
            print(data)
        }
    }
}

