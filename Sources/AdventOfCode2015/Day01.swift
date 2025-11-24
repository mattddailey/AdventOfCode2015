import ArgumentParser

struct Day01: AdventOfCodeDay {
  static let day = 1

  func parse(_ input: String) async throws -> [Character] {
    Array(input.trimmingCharacters(in: .whitespacesAndNewlines))
  }

  func part1(_ input: [Character]) async throws -> Int {
    input
      .map { $0 == "(" ? 1 : -1 }
      .reduce(0, +)
  }

  func part2(_ input: [Character]) async throws -> Int {
    var floor = 0
    
    return input
      .enumerated()
      .compactMap { index, element in
        floor += (element == "(" ? 1 : -1)
        
        return if floor < 0 {
          index + 1
        } else {
          nil
        }
      }
      .first ?? 0
  }
}
