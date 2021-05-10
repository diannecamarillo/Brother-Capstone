//
//  SavedNotes.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 4/16/21.
//

import Foundation

class SavedNotes : Identifiable {
    public var id: Int64 = 0
    public var title: String = ""
    public var eventDescription: String = ""
    public var eventTime: Int64 = 0
}
