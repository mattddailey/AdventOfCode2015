import ArgumentParser

struct Day03: AdventOfCodeDay {
  static let day = 3

  func parse(_ input: String) async throws -> [Offset] {
    input
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .compactMap {
        guard let move = Move(rawValue: String($0)) else {
          return nil
        }
        
        return move.offset
      }
  }

  func part1(_ input: [Offset]) async throws -> Int {
    let startingOffset = Offset(x: 0, y: 0)
    var offsetsVisited = Set([startingOffset])
    var currentOffset = startingOffset
    
    input.forEach {
      currentOffset += $0
      offsetsVisited.insert(currentOffset)
    }
    
    return offsetsVisited.count
  }

  func part2(_ input: [Offset]) async throws -> Int {
    let startingOffset = Offset(x: 0, y: 0)
    var offsetsVisited = Set([startingOffset])
    var currentSantaOffset = startingOffset
    var currentRoboSantaOffset = startingOffset
    
    input.enumerated().forEach { index, offset in
      if index % 2 == 0 {
        currentSantaOffset += offset
        offsetsVisited.insert(currentSantaOffset)
      } else {
        currentRoboSantaOffset += offset
        offsetsVisited.insert(currentRoboSantaOffset)
      }
    }
    
    return offsetsVisited.count
  }
}

extension Day03 {
  enum Move: String {
    case up = "^"
    case down = "v"
    case left = "<"
    case right = ">"
    
    var offset: Offset {
      switch self {
      case .up:
        Offset(x: 0, y: 1)
      case .down:
        Offset(x: 0, y: -1)
      case .left:
        Offset(x: -1, y: 0)
      case .right:
        Offset(x: 1, y: 0)
      }
    }
  }
  
  struct Offset: Hashable {
    let x: Int
    let y: Int

    static func +(lhs: Offset, rhs: Offset) -> Offset {
      Offset(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func +=(lhs: inout Offset, rhs: Offset) {
      lhs = lhs + rhs
    }
  }
}
