//
//  PerformanceDTO.swift
//  CA_Trial
//
//  Created by JINHUN CHOI on 2024/05/08.
//

import Foundation

// MARK: ShowDTO
struct PerformanceDTO: Codable {
    let culturalEventInfo: CulturalEventInfo
    
    // MARK: CulturalEventInfo
    struct CulturalEventInfo: Codable {
        let listTotalCount: Int
        let result: Result
        let row: [Row]

        enum CodingKeys: String, CodingKey {
            case listTotalCount = "list_total_count"
            case result = "RESULT"
            case row
        }
        
        // MARK: Result
        struct Result: Codable {
            let code, message: String

            enum CodingKeys: String, CodingKey {
                case code = "CODE"
                case message = "MESSAGE"
            }
        }
        
        // MARK: Row
        struct Row: Codable {
            let codename, guname, title, date: String
            let place, orgName, useTrgt, useFee: String
            let player: String
            let program: String
            let etcDesc: String
            let orgLink: String
            let mainImg: String
            let rgstdate: String
            let ticket: Ticket
            let strtdate, endDate: String
            let themecode: String
            let lot, lat: String
            let isFree: IsFree
            let hmpgAddr: String

            enum CodingKeys: String, CodingKey {
                case codename = "CODENAME"
                case guname = "GUNAME"
                case title = "TITLE"
                case date = "DATE"
                case place = "PLACE"
                case orgName = "ORG_NAME"
                case useTrgt = "USE_TRGT"
                case useFee = "USE_FEE"
                case player = "PLAYER"
                case program = "PROGRAM"
                case etcDesc = "ETC_DESC"
                case orgLink = "ORG_LINK"
                case mainImg = "MAIN_IMG"
                case rgstdate = "RGSTDATE"
                case ticket = "TICKET"
                case strtdate = "STRTDATE"
                case endDate = "END_DATE"
                case themecode = "THEMECODE"
                case lot = "LOT"
                case lat = "LAT"
                case isFree = "IS_FREE"
                case hmpgAddr = "HMPG_ADDR"
            }
        }
    }
}

enum IsFree: String, Codable {
    case 무료 = "무료"
    case 유료 = "유료"
}

enum Ticket: String, Codable {
    case 기관 = "기관"
    case 시민 = "시민"
}

extension PerformanceDTO.CulturalEventInfo.Row {
    func toPerformance() -> Performance {
        return .init(
            codename: codename,
            guname: guname,
            title: title,
            date: date,
            place: place,
            orgName: orgName,
            useTrgt: useTrgt,
            useFee: useFee,
            player: player,
            program: program,
            etcDesc: etcDesc,
            orgLink: orgLink,
            mainImg: mainImg,
            rgstdate: rgstdate,
            ticket: ticket,
            strtdate: strtdate,
            endDate: endDate,
            themecode: themecode,
            isFree: isFree
        )
    }
}
