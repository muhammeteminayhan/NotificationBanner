//
//  NotificationBanner.swift
//  NotificationBanner
//
//  Created by Muhammet Emin Ayhan on 25.10.2024.
//

import SwiftUI

struct NotificationBanner<Content: View>: View {
    let type: NotificationBannerType
    let title: String
    let message: String?
    let duration: Double
    let onDismiss: () -> Void
    let position: NotificationBannerPosition
    let animation: Animation
    let additionalContent: () -> Content
    
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack {
            if position == .top {
                if isVisible {
                    bannerContent
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .animation(animation, value: isVisible)
                }
            }
            
            if position == .center {
                if isVisible {
                    bannerContent
                        .transition(.scale.combined(with: .opacity))
                        .animation(animation, value: isVisible)
                }
            }
            
            Spacer()
            
            if position == .bottom {
                if isVisible {
                    bannerContent
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .animation(animation, value: isVisible)
                }
            }
        }
        .onAppear {
            showBanner()
        }
    }
    
    var bannerContent: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: type.iconName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    if let message = message {
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Button {
                    dismissBanner()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding(8)
                }
            }
            additionalContent()
        }
        .padding()
        .background(type.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding([.horizontal, position == .top ? .top : .bottom], 16)
    }
    
    func showBanner() {
        withAnimation {
            isVisible = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            dismissBanner()
        }
    }
    
    func dismissBanner() {
        withAnimation {
            isVisible = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onDismiss()
        }
    }
}
