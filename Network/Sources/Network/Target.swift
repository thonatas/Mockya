//
//  ModelAPI.swift
//  
//
//  Created by Thonatas Borges on 5/6/22.
//

import Foundation
import Moya

enum Target {
    case getData()
}

extension Target: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.jsonbin.io/b")!
    }
    
    var path: String {
        return "/62754d7a25069545a32e6051"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}

