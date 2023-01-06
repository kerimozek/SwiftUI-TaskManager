//
//  Home.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 3.01.2023.
//

import SwiftUI


struct Home: View {
    @StateObject var taskModel: TaskViewModel = .init()
    // MARK: Matched Geometry NameSpace
    @Namespace var animation
    
    // MARK: Fetching Task
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)], predicate: nil, animation: .easeInOut) var tasks: FetchedResults<Task>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome Back")
                        .font(.callout)
                    Text("Here's Update Today.")
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                CustomSegmentedBar()
                    .padding(.top,5)
            }
            .padding()
        }
        .overlay(alignment: .bottom) {
            Button {
                taskModel.openEditTask.toggle()
            } label: {
                Label {
                    Text("Add Text")
                        .font(.callout)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "plus.app.fill")
                }
                .foregroundColor(.white)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(.black, in: Capsule())
            }
            .padding(.top,10)
            .frame(maxWidth: .infinity)
            .background{
                LinearGradient(colors: [
                    .white.opacity(0.05),
                    .white.opacity(0.4),
                    .white.opacity(0.7),
                    .white
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            }
        }
        .fullScreenCover(isPresented: $taskModel.openEditTask) {
            taskModel.resetTaskData()
        } content: {
            AddNewTask()
                .environmentObject(taskModel)
        }
    }
    
    // MARK: TaskView
    @ViewBuilder
    func TaskView()->some View{
        LazyVStack(spacing: 20) {
            ForEach(tasks){task in
                
            }
        }
        .padding(.top,20)
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func TaskRowView(task: Task)->some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text(task.type ?? "")
                    .font(.callout)
                    .padding(.vertical,5)
                    .padding(.horizontal)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.3))
                    }
                
                Spacer()
                
                // MARK: Edit Button Only For Non Completed Tasks
                if !task.isCompleted{
                    Button{
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                    }
                }
            }
            
            
        }
        .padding()
        frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(task.color ?? "Yellow"))
            }
    }
    
    
    
    // MARK: Custom Segmented Bar
    @ViewBuilder
    func CustomSegmentedBar()->some View {
        let tabs = ["Today", "Upcoming", "Task Done"]
        HStack(spacing: 10){
            ForEach(tabs,id: \.self){ tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .scaleEffect(0.9)
                
                    .foregroundColor(taskModel.currentTab == tab ? .white : .black)
                    .padding(.vertical, 6)
                    .frame(maxWidth: .infinity)
                    .background{
                        if taskModel.currentTab == tab {
                            Capsule()
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{taskModel.currentTab = tab}
                    }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
