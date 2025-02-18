//
//  Collection.swift
//  TextEditing
//
//  CotEditor
//  https://coteditor.com
//
//  Created by 1024jp on 2024-06-19.
//
//  ---------------------------------------------------------------------------
//
//  © 2016-2024 1024jp
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

// MARK: - Unique

extension Sequence where Element: Equatable {
    
    /// An array consists of unique elements of receiver by keeping ordering.
    var uniqued: [Element] {
        
        self.reduce(into: []) { (unique, element) in
            guard !unique.contains(element) else { return }
            
            unique.append(element)
        }
    }
}


// MARK: - Sort

extension Sequence {
    
    /// Returns the elements of the sequence, sorted using the value that the given key path refers as the comparison between elements.
    ///
    /// - Parameter keyPath: The key path to the value to compare.
    /// - Returns: A sorted array of the sequence’s elements.
    func sorted(_ keyPath: KeyPath<Element, some Comparable>) -> [Element] {
        
        self.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
}


extension MutableCollection where Self: RandomAccessCollection {
    
    /// Sorts the collection in place, using the value that the given key path refers as the comparison between elements.
    ///
    /// - Parameter keyPath: The key path to the value to compare.
    mutating func sort(_ keyPath: KeyPath<Element, some Comparable>) {
        
        self.sort { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
}
