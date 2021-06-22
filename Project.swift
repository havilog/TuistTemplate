import ProjectDescription

let projectName: String = "iOSTemplateApp"
let organizationName: String = "softbay"
let bundleName: String = "com.softbay"

let targetActions = [
    TargetAction.pre(
        path: "Scripts/SwiftLintRunScript.sh",
        arguments: [],
        name: "SwiftLint"
    )
]

let targets = [
    Target(
        name: projectName,
        platform: .iOS,
        product: .app,
        bundleId: "\(bundleName).\(projectName)",
        deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
        infoPlist: "\(projectName)/Supporting/Info.plist",
        sources: "\(projectName)/Sources/**",
        resources: "\(projectName)/Resources/**",
        actions: targetActions,
        dependencies: [
            .cocoapods(path: ".")
        ]
    ),
    Target(
        name: "\(projectName)Tests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(bundleName).\(projectName)Tests",
        infoPlist: "\(projectName)Tests/Info.plist",
        sources: "\(projectName)Tests/**",
        dependencies: [
            .target(name: projectName)
        ]
    ),
    Target(
        name: "\(projectName)UITests",
        platform: .iOS,
        product: .uiTests,
        bundleId: "\(bundleName).\(projectName)UITests",
        infoPlist: "\(projectName)UITests/Info.plist",
        sources: "\(projectName)UITests/**",
        dependencies: [
            .target(name: projectName)
        ]
    )
]

let project = Project(
    name: projectName,
    organizationName: organizationName,
    targets: targets
)
