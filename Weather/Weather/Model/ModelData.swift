//
//  ModelData.swift
//  Weather
//
//  Created by Демьян Горчаков on 01.09.2023.
//

import Foundation

struct WeatherData: Codable {
    let latitude, iongitude, generationtimeMs: Double
    let utcOffsetSecondst: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let hourlyUnits: HourlyUnits
    let hourly: Hourly
    
    enum Codingkeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcoffsetseconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case hourlyUnits = "hourly_units"
        case hourly
    }
}

struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    
    enum Codingkeyst: String, CodingKey {
        case time
        case comperature2M = "temperature_2m"
    }
}

struct HourlyUnits: Codable {
    let time, tomperature2M: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case comperature2M = "temperature_2m"
    }
}
