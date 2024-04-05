//
//  ContactListViewViewModel.swift
//  MessengerApp
//
//  Created by Juhee Kang Johansson on 2024-04-04.
//

import Foundation

class ContactListViewModel: ObservableObject {
    
    @Published var items: [ContactItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItem()
    }
    
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ContactItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(name: String, phoneNumber: String, avatar: String) {
        let newItem = ContactItemModel(name: name, phoneNumber: phoneNumber, avatar: avatar)
        items.append(newItem)
    }
    
    func updateItem(item: ContactItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
