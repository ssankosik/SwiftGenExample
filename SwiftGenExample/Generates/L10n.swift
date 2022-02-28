// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Common {
    public static let cancel = L10n.tr("Common", "cancel")
    public static let comfirm = L10n.tr("Common", "comfirm")
    public static let error = L10n.tr("Common", "error")
    public static let loading = L10n.tr("Common", "loading")
    public enum Sub {
      public static let cancel = L10n.tr("Common", "sub.cancel")
      public static let comfirm = L10n.tr("Common", "sub.comfirm")
      public static let error = L10n.tr("Common", "sub.error")
      public static let loading = L10n.tr("Common", "sub.loading")
    }
  }
  public enum Home {
    public static let cancel = L10n.tr("Home", "cancel")
    public static let comfirm = L10n.tr("Home", "comfirm")
    public static let error = L10n.tr("Home", "error")
    public static let loading = L10n.tr("Home", "loading")
  }
  public enum Parameter {
    public enum Parameter {
      public static func number(_ p1: Int, _ p2: Float, _ p3: Float) -> String {
        return L10n.tr("Parameter", "parameter.number", p1, p2, p3)
      }
      public static func string(_ p1: Any) -> String {
        return L10n.tr("Parameter", "parameter.string", String(describing: p1))
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
