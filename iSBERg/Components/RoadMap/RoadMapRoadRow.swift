//
//  RoadMapRoadRow.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI

struct RoadMapRoadShape: Shape {
    
    let alignment: RoadMapRowAlignment
    
    func path(in rect: CGRect) -> Path {
        switch alignment {
        case .leftToRight:
            return leftToRightPath(in: rect)
        case .rightToLeft:
            return rightToLeftPath(in: rect)
        }
    }
    
    private func leftToRightPath(in rect: CGRect) -> Path {
        var path = Path()
        
        let originPoint = CGPoint(
            x: rect.origin.x + 35,
            y: rect.origin.y
        )
        
        path.move(to: originPoint)
        
        path.addLine(to: CGPoint(
            x: originPoint.x,
            y: originPoint.y + rect.height / 2 - 20
        ))
        
        path.addArc(
            center: CGPoint(
                x: originPoint.x + 20,
                y: originPoint.y + rect.height / 2 - 20
            ),
            radius: 20,
            startAngle: .radians(.pi),
            endAngle: .radians(.pi / 2),
            clockwise: true
        )
        
        path.addLine(to: CGPoint(
            x: rect.width - 55,
            y: originPoint.y + rect.height / 2
        ))
        
        path.addArc(
            center: CGPoint(
                x: rect.width - 55,
                y: originPoint.y + rect.height / 2 + 20
            ),
            radius: 20,
            startAngle: .radians(3 * .pi / 2),
            endAngle: .radians(0),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(
            x: rect.width - 35,
            y: rect.height
        ))
        
        return path
    }
    
    private func rightToLeftPath(in rect: CGRect) -> Path {
        var path = Path()
        
        let originPoint = CGPoint(
            x: rect.width - 35,
            y: rect.origin.y
        )
        
        path.move(to: originPoint)
        
        path.addLine(to: CGPoint(
            x: originPoint.x,
            y: originPoint.y + rect.height / 2 - 20
        ))
        
        path.addArc(
            center: CGPoint(
                x: originPoint.x - 20,
                y: originPoint.y + rect.height / 2 - 20
            ),
            radius: 20,
            startAngle: .radians(0),
            endAngle: .radians(.pi / 2),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(
            x: rect.origin.x + 55,
            y: originPoint.y + rect.height / 2
        ))
        
        path.addArc(
            center: CGPoint(
                x: rect.origin.x + 55,
                y: originPoint.y + rect.height / 2 + 20
            ),
            radius: 20,
            startAngle: .radians(3 * .pi / 2),
            endAngle: .radians(.pi ),
            clockwise: true
        )
        
        path.addLine(to: CGPoint(
            x: rect.origin.x + 35,
            y: rect.height
        ))
        
        return path
    }
    
}

struct RoadMapRoadRow: View {
    
    let alignment: RoadMapRowAlignment
    let completed: Bool
    
    var body: some View {
        RoadMapRoadShape(alignment: alignment)
            .stroke(lineWidth: 1)
            .foregroundColor(completed ? .white : AppColors.gray01)
    }
}

struct RoadMapRoadRow_Previews: PreviewProvider {
    static var previews: some View {
        RoadMapRoadRow(alignment: .rightToLeft, completed: true)
    }
}
