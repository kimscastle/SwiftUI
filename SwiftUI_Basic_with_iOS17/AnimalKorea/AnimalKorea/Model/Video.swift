//
//  Video.swift
//  AnimalKorea
//
//  Created by uiskim on 3/22/24.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let videoID: String
    
    // 전부다있어야함
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case headline
        case videoID = "videoid"
    }
    
    static let sampleVideoData = Video(id: "tiger", name: "호랑이", headline: "호랑이는 식육목 고양이과에 속하는 포유류로, 고양이과 동물들 중 가장 큰 동물이다. 등의 털색은 선명한 황갈색이고 불규칙적인 검은색 줄무늬가 많다.", videoID: "FK3dav4bA4s")
}
