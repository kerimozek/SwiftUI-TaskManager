//
//  AddNewTask.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 5.01.2023.
//

import SwiftUI

struct AddNewTask: View {
    @EnvironmentObject var taskModel: TaskViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack(spacing: 12) {
            Text("Edit Task")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button{
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                        
                    }
                }
            VStack(alignment: .leading, spacing: 12) {
                Text("Text Color")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                let colors: [String] =
                ["Yellow","Green","Blue","Purple","Red","Orange"]
                HStack(spacing: 15) {
                    ForEach(colors,id: \.self) {color in
                        Circle()
                            .fill(Color(color))
                            .frame(width: 25, height: 25)
                            .background {
                                if taskModel.taskColor == color {
                                    Circle()
                                        .strokeBorder(.gray)
                                        .padding(-3)
                                }
                            }
                            .contentShape(Circle())
                            .onTapGesture {
                                taskModel.taskColor = color
                            }
                    }
                }
                .padding(.top,10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top,30)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask()
            .environmentObject(TaskViewModel())
    }
}
