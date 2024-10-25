import SwiftUI

struct ContentView: View {
    @State private var showBanner: Bool = false
    @State private var bannerType: NotificationBannerType = .success
    @State private var bannerTitle: String = ""
    @State private var bannerMessage: String? = nil
    @State private var bannerPosition: NotificationBannerPosition = .top
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Picker("Position", selection: $bannerPosition) {
                    Text("Top").tag(NotificationBannerPosition.top)
                    Text("Center").tag(NotificationBannerPosition.center)
                    Text("Bottom").tag(NotificationBannerPosition.bottom)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Button(action: showSuccessBanner) {
                    Text("Success Action")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Button(action: showErrorBanner) {
                    Text("Error Action")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Button(action: showWarningBanner) {
                    Text("Warning Action")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                Button(action: showInfoBanner) {
                    Text("Info Action")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            
            if showBanner {
                NotificationBanner(
                    type: bannerType,
                    title: bannerTitle,
                    message: bannerMessage,
                    duration: 3.0,
                    onDismiss: {
                        showBanner = false
                    },
                    position: bannerPosition,
                    animation: .spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.5),
                    additionalContent: {
                        Text("Additional info can be placed here")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                )
                .zIndex(1)
            }
        }
    }
    
    func showSuccessBanner() {
        bannerType = .success
        bannerTitle = "Success!"
        bannerMessage = "The operation was completed successfully"
        showBanner = true
    }
    
    func showErrorBanner() {
        bannerType = .error
        bannerTitle = "Error!"
        bannerMessage = "An error occurred during the operation"
        showBanner = true
    }
    
    func showWarningBanner() {
        bannerType = .warning
        bannerTitle = "Warning!"
        bannerMessage = "There is something you need to be cautious about"
        showBanner = true
    }
    
    func showInfoBanner() {
        bannerType = .info
        bannerTitle = "Info"
        bannerMessage = "This is an informational message"
        showBanner = true
    }
}

#Preview {
    ContentView()
}
