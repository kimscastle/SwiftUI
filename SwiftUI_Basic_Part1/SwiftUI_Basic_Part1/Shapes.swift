//
//  Shapes.swift
//  SwiftUI_Basic_Part1
//
//  Created by uiskim on 2/14/24.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        Circle()
            .trim(from: 0.3, to: 1.0)
            .fill(.yellow)
//            .stroke(.blue, lineWidth: 10)
        // dash의 의미
        // 왜 array인가
        // [10] 점의길이10 빈공간의길이10 으로 해줘
        // [10, 20] 점의길이10 빈공간의길이 20으로 해줘
        // strokeBorder을 사용하기위해선 shapeView의 Content가 InsettableShape을 채택해야한다
        // fill의 결과값이 `_ShapeView<Self, S>`이고 Self가 Circle이며 Circle은 InsettableShape를 채택하기때문에 사용이가능하다
        // 하지만 trim의 결과값은 some Shape이기에 shape만 채택한 타입이 들어오기에 다른 프로토콜인 InsettableShape이 채택되었는지는 알수가 없다 그래서 trim뒤에는 못쓴다
//            .strokeBorder(.pink, style: StrokeStyle(lineWidth: 10, lineCap: .butt, dash: [10,20]))
            .frame(width: 200, height: 200)


    }
}

#Preview {
    Shapes()
}
