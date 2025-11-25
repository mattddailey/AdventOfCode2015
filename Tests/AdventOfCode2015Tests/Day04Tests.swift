import Testing
@testable import AdventOfCode2015

struct Day04Tests {
  let sample = """
  abcdef
  """

  @Test
  func testParse() async throws {
    let day = Day04()
    let parsed = try await day.parse(sample)
    #expect(parsed == "abcdef")
  }

  @Test
  func testPart1() async throws {
    let day = Day04()
    let parsed = try await day.parse(sample)
    let result = try await day.part1(parsed)
    #expect(result == 609043)
  }

  @Test
  func testPart2() async throws {
    let day = Day04()
    let parsed = try await day.parse(sample)
    let result = try await day.part2(parsed)
    #expect(result == 6742839)
  }
}
