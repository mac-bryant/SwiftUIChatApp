//
//  ChatController.swift
//  SwiftUIChatApp
//
//  Created by Mackenzie Bryant on 4/20/20.
//  Copyright © 2020 Mackenzie Bryant. All rights reserved.
//

import Combine
import SwiftUI

// ChatController needs to be a ObservableObject in order
// to be accessible by SwiftUI
class ChatController : ObservableObject {
    // didChange will let the SwiftUI know that some changes have happened in this object
    // and we need to rebuild all the views related to that object
    var didChange = PassthroughSubject<Void, Never>()
    
    // We've relocated the messages from the main SwiftUI View. Now, if you wish, you can handle the networking part here and populate this array with any data from your database. If you do so, please share your code and let's build the first global open-source chat app in SwiftUI together
    // It has to be @Published in order for the new updated values to be accessible from the ContentView Controller
    @Published var messages = [
        ChatMessage(message: "Hey, how are you?", avatar: "Alan", color: .red),
        ChatMessage(message: "I'm doing great!", avatar: "Bob", color: .blue)
    ]
    
    // this function will be accessible from SwiftUI main view
    // here you can add the necessary code to send your messages not only to the SwiftUI view, but also to the database so that other users of the app would be able to see it
    func sendMessage(_ chatMessage: ChatMessage) {
        // here we populate the messages array
        messages.append(chatMessage)
        // here we let the SwiftUI know that we need to rebuild the views
        didChange.send(())
    }
    
}
