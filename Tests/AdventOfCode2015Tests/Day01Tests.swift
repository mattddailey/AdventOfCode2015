import Testing
@testable import AdventOfCode2015

struct Day01Tests {
  let sample = """
  ()())
  """

  @Test
  func testParse() async throws {
    let day = Day01()
    let parsed = try await day.parse(sample)
    #expect(parsed == Array(sample))
  }

  @Test
  func testPart1() async throws {
    let day = Day01()
    let parsed = try await day.parse(sample)
    let result = try await day.part1(parsed)
    #expect(result == -1)
  }

  @Test
  func testPart2() async throws {
    let day = Day01()
    let parsed = try await day.parse(sample)
    let result = try await day.part2(parsed)
    #expect(result == 5)
  }
}
