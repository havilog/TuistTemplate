import ProjectDescription

let projectName: String = "iOSTemplateApp"
let organizationName: String = "havi"
let bundleName: String = "com.havi"

let schemes = [
    Scheme(
        name: "\(projectName)-Debug",
        shared: true,
        buildAction: BuildAction(targets: ["\(projectName)"]),
        testAction: TestAction(
            targets: ["\(projectName)Tests"],
            configurationName: "Debug",
            coverage: true
        ),
        runAction: RunAction(configurationName: "Debug"),
        archiveAction: ArchiveAction(configurationName: "Debug"),
        profileAction: ProfileAction(configurationName: "Debug"),
        analyzeAction: AnalyzeAction(configurationName: "Debug")
    ),
    Scheme(
        name: "\(projectName)-Inhouse",
        shared: true,
        buildAction: BuildAction(targets: ["\(projectName)"]),
        testAction: TestAction(
            targets: ["\(projectName)Tests"],
            configurationName: "Inhouse",
            coverage: true
        ),
        runAction: RunAction(configurationName: "Inhouse"),
        archiveAction: ArchiveAction(configurationName: "Inhouse"),
        profileAction: ProfileAction(configurationName: "Inhouse"),
        analyzeAction: AnalyzeAction(configurationName: "Inhouse")
    ),
    Scheme(
        name: "\(projectName)-Release",
        shared: true,
        buildAction: BuildAction(targets: ["\(projectName)"]),
        testAction: TestAction(
            targets: ["\(projectName)Tests"],
            configurationName: "Release",
            coverage: true
        ),
        runAction: RunAction(configurationName: "Release"),
        archiveAction: ArchiveAction(configurationName: "Release"),
        profileAction: ProfileAction(configurationName: "Release"),
        analyzeAction: AnalyzeAction(configurationName: "Release")
    ),
]

let settings = Settings(configurations: [
    .debug(name: "Debug", settings: [
        "Template_Bundle_Identifier": "\(bundleName).iOSTemplateApp",
        "Template_Bundle_Name": "Template_Debug"
    ]),
    .debug(name: "Inhouse", settings: [
        "Template_Bundle_Identifier": "\(bundleName).iOSTemplateApp-Inhouse",
        "Template_Bundle_Name": "Template_Inhouse"
    ]),
    .release(name: "Release", settings: [
        "Template_Bundle_Identifier": "\(bundleName).iOSTemplateApp",
        "Template_Bundle_Name": "Template_Release"
    ])
])

let targetActions = [
    TargetAction.pre(
        path: "Scripts/SwiftLintRunScript.sh",
        arguments: [],
        name: "SwiftLint"
    ),
    TargetAction.pre(
        path: "Scripts/FirebaseCrashlyticsScript.sh",
        arguments: [],
        name: "Crashlytics"
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
        resources: [
            "\(projectName)/Resources/**",
//            .folderReference(path: "\(projectName)/Supporting"),
            "\(projectName)/Supporting/GoogleService-Info.plist"
        ],
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
    settings: settings,
    targets: targets,
    schemes: schemes
)
