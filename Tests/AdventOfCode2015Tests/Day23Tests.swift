import Testing
@testable import AdventOfCode2015

struct Day23Tests {
  let sample = """
  """

  @Test
  func testParse() async throws {
    let day = Day23()
    let parsed = try await day.parse(sample)
    #expect(parsed.isEmpty == false)
  }

  @Test
  func testPart1() async throws {
    let day = Day23()
    let parsed = try await day.parse(sample)
    let result = try await day.part1(parsed)
    #expect(result == "Not implemented")
  }

  @Test
  func testPart2() async throws {
    let day = Day23()
    let parsed = try await day.parse(sample)
    let result = try await day.part2(parsed)
    #expect(result == "Not implemented")
  }
}
