import Foundation

struct Albums: Identifiable, Hashable  {
    var id = UUID()
    var zRank: String = ""
    var artist: String = ""
    var album: String = ""
    var date: String = ""
    var genres: String = ""
    var rymRating: String = ""
    var ratings: String = ""
    var reviews: String = ""
    
    init(raw: [String]) {
        zRank = raw[0]
        album = raw[2]
        artist = raw[1]
        date = raw[3]
        genres = raw[4]
        rymRating = raw[5]
        ratings = raw[6]
        reviews = raw[7]
    }
}

func loadCSV(from csvName: String) -> [Albums] {
    var csvToStruct = [Albums]()
    
    guard let filepath = Bundle.main.path(forResource: csvName, ofType: "csv") else{
        return[]
    }
    
    var data = ""
    
    do{
        data = try String(contentsOfFile: filepath)
    } catch {
        print(error)
        return[]
    }
    
    var rows = data.components(separatedBy: "\n")
    
    let columnCount = rows.first?.components(separatedBy: ",").count
    
    rows.removeFirst()
    
    for row in rows{
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount {
            let albumStruct = Albums.init(raw: csvColumns)
            csvToStruct.append(albumStruct)
        }
    }
    
    return csvToStruct
}
