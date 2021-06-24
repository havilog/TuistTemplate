platform :ios, '13.0'

target 'iOSTemplateApp' do
  use_frameworks!

  # Firebase
  
  pod 'Firebase/Analytics', '~> 8.1.1'
  pod 'Firebase/Crashlytics', '~> 8.1.1'

  # Network
  
  pod 'Moya/RxSwift', '~> 14.0.0' # Alamofire와 Rx를 한번 더 wrapping하여 테스터블하고 endpoint 사용이 가능한 라이브러리
  
  # Database
  
  pod 'RealmSwift', '~> 10.8.0' # 현재 구조에서는 UserDefaults와 Realm을 사용하여 데이터를 저장
  
  # UI
  
  pod 'SnapKit', '~> 5.0.1' # 코드로 UI를 쉽게 구현하기 위해 적용
  
  # Architecture
  
  pod 'ReactorKit', '~> 2.1.1' # 단방향 반응형 비동기 처리를 위한 프레임워크
  
  # Rx
  
  pod 'RxSwift', '~> 5.0' # 반응형 프로그래밍에서 비동기 처리를 쉽게 하기 위해 선언
  pod 'RxCocoa', '~> 5.0' # UI Property들의 비동기 처리 바인딩
  
  # Util
  
  pod 'Then', '~> 2.7.0' # 없으면 개발 못함 ㅎ
  
  # DI
  
  pod 'Swinject', '~> 2.7.1' # DI container개념을 도입하여 의존성을 쉽게 주입
  
  target 'iOSTemplateAppTests' do
    inherit! :search_paths
    
    pod 'Quick', '~> 4.0.0' # 테스트 함수의 문서화
    pod 'Nimble', '~> 9.2.0' # 테스트 함수의 문서화
    
    pod 'RxBlocking', '~> 5.0' # 비동기 시퀀스의 결과를 toblocking으로 받아서 처리하기 위함
  end

  target 'iOSTemplateAppUITests' do
  end

end

# ignore all warnings from all pods

inhibit_all_warnings!

# deploy target warning 제거

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
