//
//  main.swift
//  Short task
//
//  Created by Yura on 20.09.2022.
//

import Foundation

/**
  Implement mobile phone storage protocol
  Requirements:
  - Mobiles must be unique (IMEI is an unique number)
  - Mobiles must be stored in memory
 */


protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

struct Mobile: Hashable {
    let imei: String
    let model: String
}

class Storage: MobileStorage {
    private var mobiles: Set<Mobile> = []
    
    func getAll() -> Set<Mobile> {
        return mobiles
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        return mobiles.filter({ $0.imei == imei }).first
//       return mobiles.first(where: { $0.imei == imei } )      // Both works
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        guard !mobiles.contains(mobile) else {
            throw NSError(domain: "This mobile already exists in list of mobiles", code: 1)
        }
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        guard mobiles.contains(product) else {
            throw NSError(domain: "List of mobiles does not contain this mobile", code: 2)
        }
        mobiles.remove(product)
    }
    
    func exists(_ product: Mobile) -> Bool {
        return mobiles.contains(product)
    }
}
