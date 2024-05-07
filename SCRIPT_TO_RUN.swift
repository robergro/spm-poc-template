import Foundation

// TODO: documentation: name of the reposition (should start with spark-ios then add the name of the component: spark-ios-tag, spark-ios-progress-tracker, ...)

// MARK: - Constants

enum Constants {
    enum Default {
        // TODO: adding ___ before and after the word
        static let defaultName = "YOUR_COMPONENT"
        static let defaultUsername = "YOUR_NAME"
        static let defaultDate = "CURRENT_DATE"
        static let defaultYear = "CURRENT_YEAR"
    }
}

// MARK: - Configuration

let username = NSFullUserName()
let date = currentDate()
let year = currentYear()
let currentDirectory = FileManager.default.currentDirectoryPath
var name = componentName()

// MARK: - Header

consoleLog("\n")

consoleLog("-", .magenta, .bold)
consoleLog("---", .magenta, .bold)
consoleLog("-----", .magenta, .bold)
consoleLog("SPARK COMPONENT TEMPLATE", .magenta, .bold)
consoleLog("-----", .magenta, .bold)
consoleLog("---", .magenta, .bold)
consoleLog("-", .magenta, .bold)

consoleLog("\n\n")

consoleLog("************************", .blue)
consoleLog("CONFIGURATION PROPERTIES ", .blue, .bold)
consoleLog("- Component: " + name, .cyan)
consoleLog("- Directory: " + currentDirectory, .cyan)
consoleLog("- Username: " + username, .cyan)
consoleLog("- Date: " + date, .cyan)
consoleLog("- Year: " + year, .cyan)
consoleLog("************************", .blue)

consoleLog("\n\n")

// MARK: - Load

load()

func load() {
    // Rename all folders
    consoleLog("************************", .blue)
    consoleLog("RENAME FOLDERS", .cyan, .bold)
    consoleLog("**", .blue)
    renameAll(forType: .folder)
    consoleLog("************************", .blue)
    consoleLog("\n\n")

    // Rename all files
    consoleLog("************************", .blue)
    consoleLog("RENAME FILES ", .cyan, .bold)
    consoleLog("**", .blue)
    renameAll(forType: .file)
    consoleLog("************************", .blue)
    consoleLog("\n\n")
}

// MARK: - Rename

func renameAll(forType type: PathType) {
    let ignorePaths = [".git", ".sourcery", ".github", ".gitignore", ".swiftlint.yml", ".DS_Store"]
    let currentDirectory = FileManager.default.currentDirectoryPath
    if let enumerator = FileManager.default.enumerator(atPath: currentDirectory) {
        while let path = enumerator.nextObject() as? String {

            if ignorePaths.contains(path) {
                consoleLog("\(type.rawValue.capitalized) to ignore : \(path)", .info, .yellow)
            } else if !path.components(separatedBy: "/").contains(where : { ignorePaths.contains($0) }),
                      let fileType = enumerator.fileAttributes?[FileAttributeKey.type] as? FileAttributeType,
                      type.isMatching(fileType, atPath: path) {
                rename(path: path, type: type)
            }
        }
    } else {
        consoleLog("No files found !", .error, .red)
    }
}

func rename(path: String, type: PathType) {
    if path.contains(Constants.Default.defaultName) {
        let newPath = path.replacingOccurrences(of: Constants.Default.defaultName, with: name)
        do {
            try FileManager.default.moveItem(
                atPath: path,
                toPath: newPath
            )
            consoleLog("The \(type.rawValue) at this path '\(path)' was renamed to '\(newPath)'", .success, .green)
        } catch {
            consoleLog("The \(type.rawValue) at this path '\(path)' was not renamed", .error, .red)
        }
    }
}

// MARK: - Helpers

func currentDate() -> String {
    let date = Date.now
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/mm/yyyy"
    return dateFormatter.string(from: date)
}

func currentYear() -> String {
    let date = Date.now
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    return dateFormatter.string(from: date)
}

func componentName() -> String {
    guard let filename = currentDirectory.components(separatedBy: "/").last else {
        consoleLog("[Error] Wrong path, should contains at least one \"/\"", .red)
        return ""
    }

    return filename
        .replacingOccurrences(of: "spark-ios-", with: "")
        .capitalized
        .replacingOccurrences(of: "-", with: "")
}

// MARK: - Logs

func consoleLog(
    _ text: String,
    _ color: ANSI.Colors = .default,
    _ style: ANSI.Style = .none
) {
    print(color.rawValue + style.rawValue + text)
}

func consoleLog(
    _ text: String,
    _ type: LogType = .none,
    _ color: ANSI.Colors = .default,
    _ style: ANSI.Style = .none
) {
    print(color.rawValue + style.rawValue + type.rawValue + text)
}

// MARK: - Enum

enum PathType: String {
    case file
    case folder

    func isMatching(_ type: FileAttributeType, atPath path: String) -> Bool {
        switch (self, type) {
        case (.file, .typeRegular), (.folder, .typeDirectory):
            return true
        default:
            return false
        }
    }
}

enum LogType: String {
    case success = "[Success] "
    case error = "[Error] "
    case info = "[Info] "
    case none = ""
}

enum ANSI {
    enum Style: String {
        case bold = "\u{001B}[1m"
        case `default` = "\u{001B}[0m"
        case none = ""
    }

    enum Colors: String {
        case red = "\u{001B}[0;31m"
        case green = "\u{001B}[0;32m"
        case yellow = "\u{001B}[0;33m"
        case blue = "\u{001B}[0;34m"
        case magenta = "\u{001B}[0;35m"
        case cyan = "\u{001B}[0;36m"
        case `default` = "\u{001B}[0;0m"
    }
}
