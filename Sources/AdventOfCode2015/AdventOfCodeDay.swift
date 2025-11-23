import ArgumentParser
import Foundation

protocol AdventOfCodeDay: AsyncParsableCommand {
  associatedtype Input
  
  static var day: Int { get }

  func parse(_ input: String) async throws -> Input
  func part1(_ input: Input) async throws -> String
  func part2(_ input: Input) async throws -> String
}

extension AdventOfCodeDay {
  static var configuration: CommandConfiguration {
    .init(
      commandName: "day\(Self.day)",
      abstract: "Run Advent of Code Day \(Self.day)"
    )
  }

  mutating func run() async throws {
    let input = try await input(day: Self.day)
    let parsed = try await parse(input)
    let part1 = try await part1(parsed)
    let part2 = try await part2(parsed)
    print("Part 1: \(part1)")
    print("Part 2: \(part2)")
  }

  private func input(day: Int) async throws -> String {
    let fileName = "day" + String(format: "%02d", day) + ".txt"
    
    guard let fileURL = Bundle.module.url(forResource: fileName, withExtension: nil, subdirectory: "Inputs") else {
      return try await remoteInput(day: day)
    }
    
    let inputFileString = try String(contentsOf: fileURL, encoding: .utf8)
    
    guard !inputFileString.isEmpty else {
      return try await remoteInput(day: day)
    }
    
    print("Using local input for day \(day)")
    return inputFileString
  }
  
  private func remoteInput(day: Int) async throws -> String {
    print("Downloading input for day \(day)...")
    
    guard let session = ProcessInfo.processInfo.environment["AOC_SESSION"], !session.isEmpty else {
      fatalError("Please set your AOC_SESSION environment variable to your Advent of Code session cookie.")
    }
    
    guard let url = URL(string: "https://adventofcode.com/2015/day/\(day)/input") else {
      fatalError("Failed to construct input URL for day \(day), year 2015")
    }
    
    var request = URLRequest(url: url)
    request.setValue("session=\(session)", forHTTPHeaderField: "Cookie")

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      fatalError("Failed to download input for day \(day)")
    }

    guard let downloadedString = String(data: data, encoding: .utf8) else {
      fatalError("Unable to decode downloaded input data for day \(day)")
    }
    
    return downloadedString
  }
}
