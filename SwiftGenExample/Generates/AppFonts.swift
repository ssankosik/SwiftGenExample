// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
public typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum AppFonts {
  public enum SukhumvitSet {
    public static let bold = FontConvertible(name: "SukhumvitSet-Bold", family: "Sukhumvit Set", path: "SukhumvitSet-Bold.ttf")
    public static let light = FontConvertible(name: "SukhumvitSet-Light", family: "Sukhumvit Set", path: "SukhumvitSet-Light.ttf")
    public static let medium = FontConvertible(name: "SukhumvitSet-Medium", family: "Sukhumvit Set", path: "SukhumvitSet-Medium.ttf")
    public static let semiBold = FontConvertible(name: "SukhumvitSet-SemiBold", family: "Sukhumvit Set", path: "SukhumvitSet-SemiBold.ttf")
    public static let text = FontConvertible(name: "SukhumvitSet-Text", family: "Sukhumvit Set", path: "SukhumvitSet-Text.ttf")
    public static let thin = FontConvertible(name: "SukhumvitSet-Thin", family: "Sukhumvit Set", path: "SukhumvitSet-Thin.ttf")
    public static let all: [FontConvertible] = [bold, light, medium, semiBold, text, thin]
  }
  public static let allCustomFonts: [FontConvertible] = [SukhumvitSet.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(OSX)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

public extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
