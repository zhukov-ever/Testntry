// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Data {
    /// -
    internal static let empty = L10n.tr("Localizable", "data.empty")
  }

  internal enum Global {
    /// Testntry
    internal static let appName = L10n.tr("Localizable", "global.app_name")
  }

  internal enum Screen {
    internal enum Main {
      /// >
      internal static let buttonNext = L10n.tr("Localizable", "screen.main.button_next")
      /// <
      internal static let buttonPrev = L10n.tr("Localizable", "screen.main.button_prev")
      /// %@ — %@
      internal static func dateRange(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Localizable", "screen.main.date_range", String(describing: p1), String(describing: p2))
      }
      /// First day:
      internal static let firstDayTitle = L10n.tr("Localizable", "screen.main.first_day_title")
      internal enum Cell {
        /// No events
        internal static let noEvents = L10n.tr("Localizable", "screen.main.cell.no_events")
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
