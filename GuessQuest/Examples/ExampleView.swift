//
//  ExampleView.swift
//  GuessQuest
//
//  Created by Tukan van der Borgh on 18/11/2023.
//

import SwiftUI

struct ExampleView: View {
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.indigo
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: .indigo, location: 0.15),
                    .init(color: .red, location: 0.85)
                ]), startPoint: .top, endPoint: .bottom)
                Color.red
            }
            
            VStack {
                Spacer()
                Text("Content")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                Spacer()
                Button("Some action", role: .destructive, action: executeSomeAction)
                    .padding(.bottom, 50.0)
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo)
                    .alert("Super important message", isPresented: $showingAlert) {
                        Button("Delete", role: .destructive) {}
                        Button("Cancel", role: .cancel) {}
                    } message: {
                        Text("Please read this, then double it and give it to the next person.")
                    }
            }
        }
        .ignoresSafeArea()
    }
    
    func executeSomeAction() {
        showingAlert = true
    }
}

#Preview {
    ExampleView()
}
