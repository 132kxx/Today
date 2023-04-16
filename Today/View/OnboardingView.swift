//
//  BoardingView.swift
//  Today

//  Created by kxx: on 2023/04/09.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboarding: Bool

    var body: some View {
        VStack {
            Spacer()
            
            Text("Mygame")
                .fontDesign(.serif)
                .font(.title2)
                .frame(maxWidth: .infinity)
                
            Spacer()
            
            Button {
                showOnboarding.toggle()
            } label: {
                Text("Get Start")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .underline()
                    .padding()
            }
            
            Text("Designd by ")
                .font(.caption)
                .foregroundColor(.gray)
            +
            
            Text("BleuRare")
                .font(.caption)
                .foregroundColor(.gray)
                .fontWeight(.semibold)

            
        }
        .background(Color.white)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
