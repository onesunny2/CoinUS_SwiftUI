//
//  ViewModelType.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/20/25.
//

import Foundation
import Combine

protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    
    var input: Input { get set }
    var output: Output { get set }
    
    func transform()
}
