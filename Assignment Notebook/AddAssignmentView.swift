//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/24/22.
//

import SwiftUI
 
struct AddAssignmentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let course = ["High", "Medium", "Low"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Course Priority", selection: $course) {
                    ForEach(Self.course, id: \.self) { course in
                        Text(course)
                    }
                }
                TextField("Description", text: $description)
                                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
 
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {

                AddAssignmentView(assignmentList: assignmentList)

                       })
            .navigationBarTitle("Add New course", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                
                                trailing: Button(action: {

                                    showingAddAssignmentView = true}) {

                                    Image(systemName: "plus")

            })
        }
        
    }
}
 
struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}

