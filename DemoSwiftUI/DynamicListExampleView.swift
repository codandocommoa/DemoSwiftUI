//
//  DynamicListExampleView.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 2023.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
}

struct DynamicListExampleView: View {
    @State private var tasks = [Task]()
    @State private var newTask = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks) { task in
                        Text(task.title)
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(InsetGroupedListStyle())

                HStack {
                    TextField("Nova Tarefa", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: addTask) {
                        Text("Adicionar")
                    }
                    .disabled(newTask.isEmpty)
                }
                .padding()
            }
            .navigationTitle("Lista de Tarefas")
        }
    }

    func addTask() {
        let task = Task(title: newTask)
        tasks.append(task)
        newTask = ""
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct DynamicListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListExampleView()
    }
}
