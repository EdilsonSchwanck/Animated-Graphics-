//
//  Home.swift
//  AnimationGraphics
//
//  Created by Edilson Schwanck Borges on 22/10/22.
//

import SwiftUI

struct Home: View {
    //MARK: UI properties
    @State var currentWeek: [Date] = []
    @State var currentDay: Date = Date()
    
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                Text("Current Week")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .foregroundColor(.black)
            
            // MARK: Current Week View
            HStack(spacing: 10){
                ForEach(currentWeek,id: \.self){date in
                    Text(extractDate(date: date))
                        .fontWeight(isSameDay(date1: currentDay, date2: date) ? .bold : .semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isSameDay(date1: currentDay, date2: date) ? 6 : 0)
                        .padding(.horizontal, isSameDay(date1: currentDay, date2: date) ? 12 : 0)
                        .frame(width: isSameDay(date1: currentDay, date2: date) ? 140 : nil)
                        .background{
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .environment(\.colorScheme, .light)
                                .opacity(isSameDay(date1: currentDay, date2: date) ? 0.8 : 0)
                    }
                        .onTapGesture {
                            withAnimation{
                                currentDay = date
                            }
                        }
                }
            } // termina aqui
            .padding(.top,10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Steps")
                    .fontWeight(.semibold)
                
                Text("6,243")
                    .font(.system(size: 45, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical,10)
            
            //MARK: Fitness Ring View
            FitnessRingCardView()
            
            //MARK: bar graph view
            FitnessStepsGraphView()
            
            
        }
        .padding()
        .onAppear(perform: extractCurrentWeek)
    }
    
    // MARK:  Extracting Current Week
    
    
    func extractCurrentWeek(){
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let firstDay = week?.start else{
            return
        }
        (0..<7).forEach{ day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstDay){
                currentWeek.append(weekDay)
            }
            
        }
    }
    
 //MARK: Extracting Cutin date Components

    func extractDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = (isSameDay(date1: currentDay, date2: date) ? "dd MMMM" : "dd")
        
        return (isDateToday(date: date) && isSameDay(date1: currentDay, date2: date) ? "" : "") +  formatter.string(from: date)
    }
    
    // MARK: Check date
    func isDateToday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDateInToday(date)
    }

    func isSameDay(date1: Date, date2: Date) -> Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
