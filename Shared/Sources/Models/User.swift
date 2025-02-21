import Foundation

/// Represents different skill levels a user can have for tricks
/// - untried: User hasn't attempted the trick yet
/// - learning: User is in the process of learning the trick
/// - landed: User has successfully landed the trick at least once
/// - consistent: User can perform the trick reliably
/// - expert: User has mastered the trick
enum ProficiencyLevel: String, Codable {
  case untried, learning, landed, consistent, expert
}

/// Represents a user in the skateboarding tricks application
/// Manages user profile information and tracks their progress with tricks
struct User: Codable, Identifiable {
  // Core properties
  var id: UUID
  var name: String
  var avatar: String
  var bio: String
  var dateJoined: Date
  var lastActive: Date?

  // Tracking collections related to tricks
  var favorites: [UUID]
  var proficiencies: [UUID: ProficiencyLevel]

  /// Creates a new User instance
  /// - Parameters:
  ///   - id: Unique identifier for the user (defaults to new UUID)
  ///   - name: User's display name
  ///   - avatar: URL string for user's profile picture (defaults to empty string)
  ///   - bio: User's self-description (defaults to empty string)
  ///   - favorites: Array of favorite trick IDs (defaults to empty array)
  ///   - proficiencies: Dictionary mapping trick IDs to proficiency levels (defaults to empty dictionary)
  ///   - dateJoined: Date user created their account (defaults to current date)
  ///   - lastActive: Date user was last active (optional)
  init(
    id: UUID = UUID(),
    name: String,
    avatar: String = "",
    bio: String = "",
    favorites: [UUID] = [],
    proficiencies: [UUID: ProficiencyLevel] = [:],
    dateJoined: Date = Date(),
    lastActive: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.avatar = avatar
    self.bio = bio
    self.favorites = favorites
    self.proficiencies = proficiencies
    self.dateJoined = dateJoined
    self.lastActive = lastActive
  }

  /// Checks if a specific trick is marked as favorite by the user
  /// - Parameter trickID: The UUID of the trick to check
  /// - Returns: Boolean indicating whether the trick is in user's favorites
  func isFavorite(trickID: UUID) -> Bool {
    return favorites.contains(trickID)
  }

  /// Retrieves the user's proficiency level for a specific trick
  /// - Parameter trickID: The UUID of the trick to check
  /// - Returns: The user's proficiency level (defaults to .untried if not found)
  func proficiencyLevel(for trickID: UUID) -> ProficiencyLevel {
    return proficiencies[trickID] ?? .untried
  }
}
