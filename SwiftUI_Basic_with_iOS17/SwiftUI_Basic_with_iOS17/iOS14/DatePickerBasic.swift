//
//  DatePickerBasic.swift
//  SwiftUI_Basic_with_iOS17
//
//  Created by uiskim on 3/17/24.
//

import SwiftUI

struct DatePickerBasic: View {
    @State var selectedDate1 = Date()
    @State var selectedDate2 = Date()
    @State var selectedDate3 = Date()
    @State var selectedDate4 = Date()
    @State var selectedDate5 = Date()
    
    var currendDate: String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "ko_kr")
        formatter.dateFormat = "yyyy년 MM월 dd일 a HH시 mm분"
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        return formatter.string(from: current)
    }
    
    //datepicker용 formatter
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(currendDate)
                Divider()
                VStack {
                    DatePicker("기본 DatePicker", selection: $selectedDate1)
                        .tint(.red)
                        .datePickerStyle(.compact)
                        .padding(.horizontal)
                        
                    Text("선택된날짜 : \(dateToKR(selectedDate1))")
                }
                Divider()
                VStack {
                    DatePicker("달력", selection: $selectedDate2)
                        .tint(.red)
                        .datePickerStyle(.graphical)
                        .padding(.horizontal)
                    Text("선택된날짜 : \(dateToKR(selectedDate2))")
                }
            }
            .environment(\.locale, .init(identifier: "ko_KR"))
        }
    }
    
    func dateToKR(_ selectedDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "ko_kr")
        formatter.dateFormat = "yyyy년 MM월 dd일 a HH시 mm분"
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        return formatter.string(from: selectedDate)
    }
}

#Preview {
    DatePickerBasic()
}
