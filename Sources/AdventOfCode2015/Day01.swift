import ArgumentParser

struct Day01: AdventOfCodeDay {
  static let day = 1

  func parse(_ input: String) async throws -> [Character] {
    Array(input.trimmingCharacters(in: .whitespacesAndNewlines))
  }

  func part1(_ input: [Character]) async throws -> Int {
    let floor = input.reduce(0) { floor, character in
      if character == "(" {
        floor + 1
      } else if character == ")" {
        floor - 1
      } else {
        floor
      }
    }
    
    return floor
  }

  func part2(_ input: [Character]) async throws -> Int {
    var floor = 0
    
    for (position, character) in input.enumerated() {
      floor = if character == "(" {
        floor + 1
      } else if character == ")" {
        floor - 1
      } else {
        floor
      }
      
      if floor < 0 {
        return position + 1
      }
    }
    
    fatalError("Santa never went into the basement.")
  }
}
