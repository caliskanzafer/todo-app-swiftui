//
//  AddView.swift
//  TodoList
//
//  Created by Zafer Çalışkan on 15.08.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textfieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here..", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55.0)
                    .background(Color(.systemGray5))
                    .cornerRadius(10.0)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(alertTitle, isPresented: $showAlert, presenting: self) { a in
            
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textfieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
