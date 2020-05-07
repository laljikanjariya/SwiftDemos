//
//  LKRRMSDBManager.swift
//  LKRapidRMS-DB
//
//  Created by Lalji on 29/11/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit

//struct Person: Codable {
//    let name: String
//    let hobby: String
//}
//struct PerfectFamily: Codable {
//    let person: Person
//    let error: Int?
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let person = try container.decode(String.self) ["person"]
//        self.person = try JSONDecoder().decode(Person.self, from: Data(person.utf8))
//        
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        error = try values.decodeIfPresent(Int.self, forKey: .error)
//
//    }
//}
@objc open class LKRRMSDBManager: NSObject {
    @objc public static let shared = LKRRMSDBManager()
    
    //Initializer access level change now
    private override init(){
        print("LKRRMSDBManager init")
    }
    public func checkDatabase(_ objNav:UINavigationController) {
        pushActivityView(objNav)
        configureDatabase()
    }
    func pushActivityView(_ objNav:UINavigationController){
        let storyboard = UIStoryboard(name: "LKRapidRMS", bundle: Bundle(for: LKRRMSDBActivityVC.self))
        let controller = storyboard.instantiateViewController(withIdentifier: "LKRRMSDBActivityVC_sid")
        objNav.pushViewController(controller, animated: true)
    }
    func configureDatabase(){
//        let json = "{\"person\":\"{\\\"name\\\":\\\"Mike\\\",\\\"hobby\\\":\\\"fishing\\\"}\",\"error\": 1}"
//
//        do {
//            let perfectFamily = try JSONDecoder().decode(PerfectFamily.self, from: Data(json.utf8))
//            let person = perfectFamily.person
//            print(person)   // "Person(name: "Mike", hobby: "fishing")\n"
//            print(perfectFamily.error)
//        } catch {
//            print(error)
//        }
        LKRRMSDBPhase1().callPhase1Service()
//        LKRRMSDBPhase2().callPhase2Service()
//        LKRRMSDBPhase3().callPhase3Service()
    }
}
