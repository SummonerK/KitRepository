//
//  IBManager.swift
//  IBKit
//
//  Created by luofei on 2017/5/31.
//  Copyright © 2017年 luofei. All rights reserved.
//

import UIKit

public let SharedManager = IBManager.shareManager()

public enum TypeManagerStaus {
    case Default
    case haveStart
}

open class IBManager: NSObject {
    
    /**
     * swift3.0 单例样式
     * 使用方法：let mark = SingelClass.shared
     */
    
    open static let shared = IBManager()
    // 重载并私有
    private override init() {
        PrintFM("create 单例")
    }
    
    open class func shareManager() -> IBManager{
        
        struct Static {
            //Singleton instance. Initializing keyboard manger.
            static let kbManager = IBManager()
        }
        
        /** @return Returns the default singleton instance. */
        return Static.kbManager
    }
    
    //获取当前的年月日 2016-06-15
    open func getDateStringWithY_M_D() -> (String){
        let date:NSDate = NSDate()
        let dateFormatter:DateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd, HH:mm:ss"
        let dateString:String = dateFormatter.string(from: date as Date)
        
        PrintFM(dateString)
        return dateString
    }
    
    func timeCump(WithBool:Bool){
        
        let mainThreadRunLoopSource = ()
        
        mainThreadRunLoopSource.addToCurrentRunLoop()
        
        let secondaryThread = Thread(target: self, selector: "startThreadWithRunloop", object: nil)
        
        secondaryThread.start()
        
    }
    
    open func getHMS(withTimeInterval:Int)->(Int,Int,Int){
        
//        let times = NSDate(timeIntervalSince1970: TimeInterval(withTimeInterval))
        
        let HH = withTimeInterval/3600
        let MM = (withTimeInterval - HH*3600)/60
        let ss = withTimeInterval%60
        
        PrintFM("\(HH),\(MM),\(ss)")
        
        return (HH,MM,ss)
        
        
        
    }

}

//封装的日志输出功能（T表示不指定日志信息参数类型）
func PrintFM<T>(_ message:T, file:String = #file, function:String = #function,
             line:Int = #line) {
    #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        print("☆☆【☆】\(fileName)\t【☆】ATLine:\(line)\t【☆】\(function)\n【☆】LOG:\(message)")
    #endif
}
