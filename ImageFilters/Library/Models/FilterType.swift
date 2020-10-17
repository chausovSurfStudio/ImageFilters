//
//  FilterType.swift
//  ImageFilters
//
//  Created by Александр Чаусов on 17.10.2020.
//

enum FilterType: String, CaseIterable {
    case original = ""
    case chrome = "CIPhotoEffectChrome"
    case fade = "CIPhotoEffectFade"
    case instant = "CIPhotoEffectInstant"
    case mono = "CIPhotoEffectMono"
    case noir = "CIPhotoEffectNoir"
    case process = "CIPhotoEffectProcess"
    case tonal = "CIPhotoEffectTonal"
    case transfer = "CIPhotoEffectTransfer"

    var name: String {
        switch self {
        case .original:
            return "original"
        case .chrome:
            return "chrome"
        case .fade:
            return "fade"
        case .instant:
            return "instant"
        case .mono:
            return "mono"
        case .noir:
            return "noir"
        case .process:
            return "process"
        case .tonal:
            return "tonal"
        case .transfer:
            return "transfer"
        }
    }
}
