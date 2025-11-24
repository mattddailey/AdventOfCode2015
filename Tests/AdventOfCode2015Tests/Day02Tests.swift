import Testing
@testable import AdventOfCode2015

struct Day02Tests {
  let sample = """
  2x3x4
  1x1x10
  """

  @Test
  func testParse() async throws {
    let day = Day02()
    let parsed = try await day.parse(sample)
    #expect(
      parsed == [
        Day02.Dimensions(length: 2, width: 3, height: 4),
        Day02.Dimensions(length: 1, width: 1, height: 10)
      ]
    )
  }

  @Test
  func testPart1() async throws {
    let day = Day02()
    let parsed = try await day.parse(sample)
    let result = try await day.part1(parsed)
    #expect(result == 101)
  }

  @Test
  func testPart2() async throws {
    let day = Day02()
    let parsed = try await day.parse(sample)
    let result = try await day.part2(parsed)
    #expect(result == 48)
  }
}
