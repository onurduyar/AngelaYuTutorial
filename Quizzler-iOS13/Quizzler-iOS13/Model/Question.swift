//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Onur Duyar on 12.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let q: String
    let a: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}
