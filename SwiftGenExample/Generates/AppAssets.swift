// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum AppAssets {
  public enum Color {
    public enum Other {
      public static let facebookBlue = ColorAsset(name: "Other/facebook_blue")
      public static let googleRed = ColorAsset(name: "Other/google_red")
    }
    public enum Primary {
      public static let accent = ColorAsset(name: "Primary/accent")
      public static let blue = ColorAsset(name: "Primary/blue")
      public static let grey = ColorAsset(name: "Primary/grey")
      public static let lightGrey = ColorAsset(name: "Primary/light_grey")
      public static let primary = ColorAsset(name: "Primary/primary")
      public static let secondary = ColorAsset(name: "Primary/secondary")
    }
    public enum Secondary {
      public static let accent = ColorAsset(name: "Secondary/accent")
      public static let blue = ColorAsset(name: "Secondary/blue")
      public static let grey = ColorAsset(name: "Secondary/grey")
      public static let lightGrey = ColorAsset(name: "Secondary/light_grey")
      public static let primary = ColorAsset(name: "Secondary/primary")
      public static let secondary = ColorAsset(name: "Secondary/secondary")
    }
    public enum Universal {
      public static let universal = ColorAsset(name: "Universal/universal")
    }
  }
  public enum Image {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
