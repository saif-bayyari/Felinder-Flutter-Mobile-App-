// models/user.dart
//todo - i have a feeling that phoneVerifiedAt and createdAt represent the same thing
//todo - like, it's redundant
class User {
  final String id;
  final String? email;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final DateTime? emailVerifiedAt; // Better than bool
  final DateTime? phoneVerifiedAt;
  final UserRole role;
  final UserPreferences? preferences;
  final List<String> profilePictures;

  //a string of picture URLs that get hot reloaded frequently visually

  //You CAN modify the list contents:
  // fruits.add('orange');      // ✅ This works!
  // fruits.remove('apple');    // ✅ This works!
  // fruits[0] = 'mango';       // ✅ This works!
  //
  // // You CAN'T reassign the variable:
  // // fruits = ['cherry', 'grape'];  // ❌ ERROR - can't reassign final variable

  User({
    required this.id,
    required this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    required this.createdAt,
    this.lastLogin,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.role,
    this.preferences,
    List<String>? profilePictures,
  })
      : profilePictures = profilePictures ?? [],
        assert(
        email != null || phoneNumber != null,
        'At least one contact method required',
        );


  // Computed properties (getter methods)
  bool get hasEmail => email != null;

  bool get hasPhone => phoneNumber != null;

  bool get isEmailVerified => emailVerifiedAt != null;

  bool get isPhoneVerified => phoneVerifiedAt != null;

  bool get hasVerifiedContact => isEmailVerified || isPhoneVerified;

  String? get primaryProfilePicture =>
      profilePictures.isNotEmpty ? profilePictures.first : null;

  //If the profilePictures list has pictures in it,
  // give me the first one. Otherwise, give me null."


  // Computed properties
  String get fullName => '$firstName $lastName';


  // Create from JSON (API response)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      //profileImageUrl: json['profile_image_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      phoneVerifiedAt: DateTime.parse(json['phone_verified_at'] as String),
      lastLogin: json['last_login'] != null
          ? DateTime.parse(json['last_login'] as String)
          : null,
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'] as String)
          : null,

      profilePictures: json['profile_pictures'] as List<String>?,

      role: UserRole.values.firstWhere(
            (r) => r.name == json['role'],
        orElse: () => UserRole.user,
      ),
      preferences: json['preferences'] != null
          ? UserPreferences.fromJson(
          json['preferences'] as Map<String, dynamic>)
          : null,
    );
  }

  // Convert to JSON (for API requests)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'profile_pictures': profilePictures,
      'created_at': createdAt.toIso8601String(),
      'last_login': lastLogin?.toIso8601String(),
      //   'is_email_verified': isEmailVerified,
      'phone_verified_at': phoneVerifiedAt,
      'email_verified_at': emailVerifiedAt,
      'role': role.name,
      'preferences': preferences?.toJson(),
  };

  }


  // Create a copy with updated fields
  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    List<String> ?profilePictures,
    DateTime? createdAt,
    DateTime? lastLogin,
    DateTime? emailVerifiedAt,
    DateTime? phoneVerifiedAt,
    UserRole? role,
    UserPreferences? preferences,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePictures: profilePictures ?? this.profilePictures,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
      role: role ?? this.role,
      preferences: preferences ?? this.preferences,
    );
  }


  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

}


// Enum for user roles
enum UserRole {
  admin,
  moderator,
  user,
  guest,
}






// Nested model for user preferences
class UserPreferences {
  final bool emailNotifications;
  final bool pushNotifications;
  final String theme;
  final String language;

  UserPreferences({
    this.emailNotifications = true,
    this.pushNotifications = true,
    this.theme = 'light',
    this.language = 'en',
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      emailNotifications: json['email_notifications'] as bool? ?? true,
      pushNotifications: json['push_notifications'] as bool? ?? true,
      theme: json['theme'] as String? ?? 'light',
      language: json['language'] as String? ?? 'en',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'email_notifications': emailNotifications,
      'push_notifications': pushNotifications,
      'theme': theme,
      'language': language,
    };
  }
}
