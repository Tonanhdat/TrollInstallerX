//
//  InstalledApp.swift
//  TrollInstallerX
//
//  Created by Alfie on 29/03/2024.
//

import SwiftUI

struct InstalledApp: Hashable {
    let displayName: String
    let bundleName: String
    let bundleIdentifier: String
    
    var bundlePath: String? {
        return find_path_for_app(bundleName)
    }
    
    var isInstalled: Bool {
        return !(bundlePath == nil)
    }
    
    var icon: UIImage? {
        if bundlePath == nil { return nil }
        let fm = FileManager.default
        if fm.fileExists(atPath: bundlePath! + "/AppIcon60x60@2x.png") { return UIImage(contentsOfFile: bundlePath! + "/AppIcon60x60@2x.png") }
        if fm.fileExists(atPath: bundlePath! + "/AppIcon@2x.png") { return UIImage(contentsOfFile: bundlePath! + "/AppIcon@2x.png") }
        if fm.fileExists(atPath: bundlePath! + "/iOSAppIcon60x60@2x.png") { return UIImage(contentsOfFile: bundlePath! + "/iOSAppIcon60x60@2x.png") }
        return nil
    }
}


let persistenceHelperCandidates = [
    InstalledApp(displayName: "Tips", bundleName: "Tips", bundleIdentifier: "com.apple.tips"),
    InstalledApp(displayName: "Measure", bundleName: "Measure", bundleIdentifier: "com.apple.measure"),
    InstalledApp(displayName: "Compass", bundleName: "Compass", bundleIdentifier: "com.apple.compass"),
    InstalledApp(displayName: "Books", bundleName: "Books", bundleIdentifier: "com.apple.iBooks"),
    InstalledApp(displayName: "iTunes Store", bundleName: "MobileStore", bundleIdentifier: "com.apple.MobileStore"),
    InstalledApp(displayName: "Watch", bundleName: "Bridge", bundleIdentifier: "com.apple.Bridhe"),
    InstalledApp(displayName: "Translate", bundleName: "SequoiaTranslator", bundleIdentifier: "com.apple.Translate"),
    InstalledApp(displayName: "Podcasts", bundleName: "Podcasts", bundleIdentifier: "com.apple.podcasts"),
    InstalledApp(displayName: "Calculator", bundleName: "Calculator", bundleIdentifier: "com.apple.calculator"),
    InstalledApp(displayName: "Wallet", bundleName: "Passbook", bundleIdentifier: "com.apple.Passbook"),
    InstalledApp(displayName: "Apple TV", bundleName: "AppleTV", bundleIdentifier: "com.apple.tv"),
    InstalledApp(displayName: "Freeform", bundleName: "Freeform", bundleIdentifier: "com.apple.freeform"),
    InstalledApp(displayName: "Voice Memos", bundleName: "VoiceMemos", bundleIdentifier: "com.apple.VoiceMemos"),
    InstalledApp(displayName: "Stocks", bundleName: "Stocks", bundleIdentifier: "com.apple.stocks")
]

class HelperAlert: ObservableObject {
    static let shared = HelperAlert()
    @Published var showAlert: Bool = false
}