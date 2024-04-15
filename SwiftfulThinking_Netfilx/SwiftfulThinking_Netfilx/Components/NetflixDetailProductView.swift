//
//  NetflixDetailProductView.swift
//  SwiftfulThinking_Netfilx
//
//  Created by uiskim on 4/15/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailProductView: View {
    
    var title: String = "Moview Title"
    var isNew: Bool = true
    var yearRelease: String = "2024"
    var seasonCount: Int? = 2
    var hasClosedCaption: Bool = true
    var isTopTen: Int? = 6
    var descriptionText: String = "This is the description for the title that is selected and it should go multiple lines."
    var castText: String = "Cast: Nick, Your Name, Someone Else"
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(title)")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                
                Text("\(yearRelease)")
                
                if let seasonCount {
                    Text("\(seasonCount) Season")
                }
                
                if hasClosedCaption {
                    Image(systemName: "captions.bubble")
                }
            } //:HSTACK
            .foregroundStyle(.netflixLightGray)
            
            if let isTopTen {
                HStack(spacing: 8) {
                    topTenIcon
                    
                    Text("#\(isTopTen) in TV Shows Today")
                        .font(.headline)
                } //:HSTACK
            }
            
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Play")
                } //:HSTACK
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundStyle(.netflixDarkGray)
                .background(.netflixWhite)
                .clipShape(.rect(cornerRadius: 4))
                .asButton(.press) {
                    onPlayPressed?()
                }
                
                HStack {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                } //:HSTACK
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundStyle(.netflixWhite)
                .background(.netflixDarkGray)
                .clipShape(.rect(cornerRadius: 4))
                .asButton(.press) {
                    onDownloadPressed?()
                }
                
            } //:HSTACK
            .font(.callout)
            .fontWeight(.medium)
            
            Group {
                Text("\(descriptionText)")
                Text("\(castText)")
                    .foregroundStyle(.netflixLightGray)
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)

            
            
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var topTenIcon: some View {
        Rectangle()
            .fill(.netflixRed)
            .frame(width: 28, height: 28)
            .overlay {
                VStack(spacing: -4) {
                    Text("TOP")
                        .bold()
                        .font(.system(size: 8))
                    Text("10")
                        .bold()
                        .font(.system(size: 16))
                }
                .offset(y: 1)
            }
    }
}

#Preview {
    ZStack {
        // Background Color
        Color.black
            .ignoresSafeArea()
        // Content
        NetflixDetailProductView()
    } //:ZSTACK

}
