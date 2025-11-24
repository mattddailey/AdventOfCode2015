import Testing
@testable import AdventOfCode2015

struct Day03Tests {
  let sample = """
  ^>v<
  """

  @Test
  func testParse() async throws {
    let day = Day03()
    let parsed = try await day.parse(sample)
    #expect(
      parsed == [Day03.Move.up.offset, Day03.Move.right.offset, Day03.Move.down.offset, Day03.Move.left.offset]
    )
  }

  @Test
  func testPart1() async throws {
    let day = Day03()
    let parsed = try await day.parse(sample)
    let result = try await day.part1(parsed)
    #expect(result == 4)
  }

  @Test
  func testPart2() async throws {
    let day = Day03()
    let parsed = try await day.parse(sample)
    let result = try await day.part2(parsed)
    #expect(result == 3)
  }
}
