//
//  PersonalSchedule.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI

struct eatAndDrink: Identifiable {
    var id = UUID()
    var eatTime: String
    var drinkTime: String
}

struct PersonalSchedule: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Here are your eating and drinking times.")
                Spacer()
                // add list for eat times
                
                // add list for drink times
            }
        }
    }
}

struct eatTimes: View {
    var eat: eatAndDrink
    var body: some View {
        VStack {
            ZStack {
                Text(eat.eatTime)
            }
        }
    }
}

struct drinkTimes: View {
    var drink: eatAndDrink
    var body: some View {
        VStack {
            ZStack {
                Text(drink.drinkTime)
            }
        }
    }
}

struct PersonalSchedule_Previews: PreviewProvider {
    static var previews: some View {
        PersonalSchedule()
    }
}
