import ArgumentParser

struct Day02: AdventOfCodeDay {
  static let day = 2

  func parse(_ input: String) async throws -> [Dimensions] {
    input
      .components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .map {
        $0
          .components(separatedBy: "x")
          .compactMap { Int($0) }
      }
      .map {
        Dimensions(length: $0[0], width: $0[1], height: $0[2])
      }
  }

  func part1(_ input: [Dimensions]) async throws -> Int {
    input.reduce(0) { $0 + $1.surfaceArea + $1.smallestSideSurfaceArea }
  }

  func part2(_ input: [Dimensions]) async throws -> Int {
    input.reduce(0) { $0 + $1.volume + $1.smallestSidePerimeter }
  }
}

extension Day02 {
  struct Dimensions: Equatable {
    let length: Int
    let width: Int
    let height: Int
    
    var surfaceArea: Int {
      2 * (length * width + width * height + height * length)
    }
    
    var smallestSidePerimeter: Int {
      [2 * length + 2 * width, 2 * width + 2 * height, 2 * height + 2 * length].min() ?? 0
    }
    
    var smallestSideSurfaceArea: Int {
      [length  * width, width * height, height * length].min() ?? 0
    }
    
    var volume: Int {
      length * width * height
    }
  }
}
