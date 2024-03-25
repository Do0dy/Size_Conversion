// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sizeModel = try? JSONDecoder().decode(SizeModel.self, from: jsonData)

import Foundation


// MARK: - SizeModel
struct SizeModel :Decodable{
    var sizeStandards: [sizeStandard]
}

// MARK: - SizeStandard
struct sizeStandard :Decodable{
    var theUnit: String
    var male: male
    var female: female
}

// MARK: - Female
struct female : Decodable{
    var upperSplit: upperSplit
    var downSplit: downSplit
    var shoes: shoes
}

// MARK: - Male
struct male :Decodable{
    var upperSplit: upperSplit
    var downSplit: downSplit
    var shoes: shoes
}

// MARK: - upperSplit

struct upperSplit : Decodable{
    var xxs: theBodySize
    var xs: theBodySize
    var s:theBodySize
    var sm:theBodySize?
    var m:theBodySize
    var md:theBodySize?
    var l:theBodySize
    var lg:theBodySize?
    var xl:theBodySize
    var xxl:theBodySize
    var xxxl:theBodySize
    var xxxxl:theBodySize?
    var xxxxxl: theBodySize?
}

// MARK: - DownSplit
struct downSplit :Decodable{
    var xs: theBodySize
    var s: theBodySize
    var sm: theBodySize
    var m: theBodySize
    var md: theBodySize
    var l: theBodySize
    var lg: theBodySize
    var xl: theBodySize
    var xxl: theBodySize
    var xxxl: theBodySize?
    var xxxxl: theBodySize?
    var xxxxxl: theBodySize?
}

// MARK: - theBodySize
struct theBodySize :Decodable{
    var waist: size
    var hip: size?
    var chest: size?
    var usSize: String?
    var euSize: String?
}

// MARK: - size
struct size :Decodable{
    var from: Int
    var to: Int
}

// MARK: - shoes

struct shoes :Decodable{

    var the22cm: sizeScale?
    var the22AndHalfcm: sizeScale?
    var the23cm: sizeScale?
    var the23AndHalfcm: sizeScale?
    var the24cm: sizeScale?
    var the24AndHalfcm: sizeScale?
    var the25cm: sizeScale
    var the25AndHalfcm: sizeScale
    var the26cm: sizeScale
    var the26AndHalfcm: sizeScale
    var the27cm: sizeScale
    var the27AndHalfcm: sizeScale
    var the28cm: sizeScale
    var the28AndHalfcm: sizeScale
    var the29cm: sizeScale
    var the29AndHalfcm: sizeScale?
    var the30cm: sizeScale?
    var the30AndHalfcm: sizeScale?
    var the31cm: sizeScale?
    var the31AndHalfcm: sizeScale?
    var the32cm: sizeScale?
    var the32AndHalfcm: sizeScale?
    var the33cm: sizeScale?
    var the33AndHalfcm: sizeScale?
    var the34cm: sizeScale?
}

// MARK: - shoesSize
struct sizeScale :Decodable{
    var sizeInCM: Double
    var usSize: String?
    var euSize: String?
}
