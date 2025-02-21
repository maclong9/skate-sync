import Foundation

/// Categorizes skateboarding tricks into different styles
/// - basic: Fundamental skateboarding tricks
/// - vert: Tricks performed on vertical ramps
/// - street: Tricks typically performed in street skating
/// - freestyle: Creative and technical flatground tricks
enum TrickType: String, Codable {
  case basic, vert, street, freestyle
}

/// Represents a skateboarding trick with its details and instructions
struct Trick: Codable, Identifiable {
  // Core properties
  var id: UUID
  var name: String
  var type: TrickType

  // Additional details
  var description: String
  var history: String
  var footPlacement: String
  var tips: [String]

  /// Creates a new Trick instance
  /// - Parameters:
  ///   - id: Unique identifier for the trick (defaults to new UUID)
  ///   - name: Name of the trick
  ///   - type: Category/style of the trick
  ///   - description: Detailed explanation of the trick (defaults to empty string)
  ///   - history: Background information about the trick's origin (defaults to empty string)
  ///   - footPlacement: Instructions for foot positioning (defaults to empty string)
  ///   - tips: Additional advice for learning the trick (defaults to array of empty strings)
  init(
    id: UUID = UUID(),
    name: String,
    type: TrickType,
    description: String = "",
    history: String = "",
    footPlacement: String = "",
    tips: [String] = [""]
  ) {
    self.id = id
    self.name = name
    self.type = type
    self.description = description
    self.history = history
    self.footPlacement = footPlacement
    self.tips = tips
  }
}
