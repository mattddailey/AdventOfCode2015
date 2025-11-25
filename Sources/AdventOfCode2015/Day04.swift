import ArgumentParser
import CryptoKit
import Foundation

struct Day04: AdventOfCodeDay {
  static let day = 4

  func parse(_ input: String) async throws -> String {
    input.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  func part1(_ secretKey: String) async throws -> Int {
    solve(secretKey, leadingZeroCount: 5)
  }

  func part2(_ secretKey: String) async throws -> Int {
    solve(secretKey, leadingZeroCount: 6)
  }
  
  private func solve(_ secretKey: String, leadingZeroCount: Int) -> Int {
    var current = 0
    
    while true {
      guard let inputData  = "\(secretKey)\(current)".data(using: .utf8) else {
        fatalError()
      }
      
      let md5DigestString = Insecure.MD5.hash(data: inputData)
        .map { String(format: "%02hhx", $0) }
        .joined()
      
      if md5DigestString.prefix(leadingZeroCount) == String(repeating: "0", count: leadingZeroCount) {
        return current
      }
      
      current += 1
    }
  }
}
