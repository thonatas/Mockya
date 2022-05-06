//
//  File.swift
//  
//
//  Created by Thonatas Borges on 5/6/22.
//

import Foundation
import Moya

public protocol Mockable {
    var statusCode: Int? { get set }
    var data: Data? { get set }
}
