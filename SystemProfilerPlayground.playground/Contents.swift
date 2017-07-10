// Running system tools with Swift

import Foundation


// Map + Filter + reduce
let n1 = [1, 2, 3, 4 ].map{(a: Int) in a*3}.filter{$0 % 2 == 0}.reduce(0){ $0+$1}
//print(n1)
let n2 = [1, 2, 3, 4 ].map{$0*3}.filter{$0 % 2 == 0}.reduce(0){ $0+$1}

//public func getItemsFromSystemProfiler2(dataTypeString: String) -> Array<Dictionary<String, AnyObject>>? {
//    let task = Process()
//    
//    
//    task.launchPath = "/usr/sbin/system_profiler"
//    task.arguments = ["-xml", dataTypeString]
//    
//    
//    let pipe = Pipe()
//    task.standardOutput = pipe
//    
//    task.launch()
//    
//    let data = pipe.fileHandleForReading.readDataToEndOfFile()
//    let dict: AnyObject = try! PropertyListSerialization.propertyList(from: data, options: [], format: nil) as AnyObject
//    
//    
//    guard let a = dict as? Array<AnyObject> else {
//        return nil
//    }
//    
//    guard let d = a[0] as? Dictionary<String, AnyObject> else {
//        return nil
//    }
//    
//    return (d["_items"] as? Array<Dictionary<String, AnyObject>>)
//    
//}

// Lambda Syntax
//let incLong = {(a: Int) -> Int in return a + 1}
//let incShorter = {a in return a + 1}
//let incShortest = {$0 + 1}
//
//print(incLong(10))
//print(incShorter(10))
//print(incShortest(10))


//if let d = getItemsFromSystemProfiler(dataTypeString: "SPApplicationsDataType") {
//    
////    timeMe(label: "Traditional for loop"){
////        var fora = [String?](repeating: nil, count: d.count)
////        
////        for n in 0..<(d.count) {
////            if case let path as String = d[n]["path"] {
////                if let b = Bundle(path: path) {
////                    fora[n] = b.bundleIdentifier
////                }
////            }
////        }
////    }
////
////    timeMe(label: "For in loop") {
////        var fora = [String?]()
////        for appInfo in d {
////            var id: String? = nil
////            if case let path as String = appInfo["path"] {
////                if let b = Bundle(path: path) {
////                    id = b.bundleIdentifier
////                }
////            }
////            fora.append(id)
////        }
////    }
////    
////    timeMe(label: "Enumerated for loop pre allocated") {
////        var fora = [String?](repeating: nil, count: d.count)
////        for (n, appInfo) in d.enumerated() {
////            if case let path as String = appInfo["path"] {
////                if let b = Bundle(path: path) {
////                    fora[n] = b.bundleIdentifier
////                }
////            }
////        }
////    }
////    
////    var mapa: [String?] = []
////    timeMe(label: "Map") {
////        mapa = d.map{(appInfo) -> String? in
////            if case let path as String = appInfo["path"] {
////                if let b = Bundle(path: path) {
////                    return b.bundleIdentifier
////                }
////            }
////            return nil
////        }
////    }
//}

//////////////////////
//// Filter Example //
//////////////////////

//let ni = getItemsFromSystemProfiler(dataTypeString: "SPNetworkDataType")
//
//let inames = (ni ?? []).filter{(a) -> Bool in
//    return a["ip_address"] != nil
//}
//
//for device in inames {
//    
//    print("\((device["interface"] as? String) ?? "NA")")
//    
//}

//: Bad Reduce Example
//let installs = getItemsFromSystemProfiler(dataTypeString: "SPInstallHistoryDataType");
//let result = [String:Date]()
//
//
//let newest = installs?.reduce(result){(current, install) in
//    var newResult = current
//    guard let pkgName = install["_name" ] as? String  else {
//        return current
//    }
//    guard let pkgDate = install["install_date"] as? Date else {
//        return current
//    }
//    if let currentDate = current[pkgName] {
//        newResult[pkgName] = (pkgDate.compare(currentDate) == ComparisonResult.orderedAscending) ? pkgDate : currentDate
//    } else {
//        newResult[pkgName] = pkgDate;
//    }
//    
//    return newResult
//}
//print(newest ?? "No results")


///////////////////////////
//// Good Reduce Example //
///////////////////////////

// /bin/ps -A -o "pcpu comm"

//let psText = launchAndGetText(path: "/bin/ps", args: ["-A", "-o", "pcpu comm"])
//var psLines = psText.components(separatedBy: "\n").map{$0.trimmingCharacters(in: .whitespacesAndNewlines)}
//
//psLines.removeFirst()
//
//if(psLines.last == "") {
//    psLines.removeLast()
//}
//
//let t = psLines.reduce(("", 0.0)) { (currentHog, potentialHog) -> (String, Double) in
//    let firstSplit = potentialHog.characters.split(maxSplits: 1, omittingEmptySubsequences: true, whereSeparator: {$0 == " "}).map(String.init)
//    
//    if firstSplit.count == 2 {
//        let pHogName = firstSplit[1]
//        if let pHogVal = Double(firstSplit[0]) {
//            if(pHogVal > currentHog.1) {
//                return (pHogName, pHogVal)
//            }
//        }
//    }
//    return currentHog
//}
//print(t)
//

//let p = getItemsFromSystemProfiler(dataTypeString: "SPConfigurationProfileDataType")

//for n in p {
//    print (n)
//}

//if let p = getItemsFromSystemProfiler(dataTypeString: "SPConfigurationProfileDataType") {
//    for i in p {
//        print(i["_name"] ?? "Something is very wrong")
//
//        if let i2 = i["_items"] as? [[NSString: AnyObject]] {
//            for q in i2 {
//                let m = Mirror(reflecting: q)
//                print (m)
//                for (key, val) in q {
//                    print("key = \(key), val = \(val)")
//                }
//            }
//        }
//    }
//} else {
//    print("bad p")
//}
