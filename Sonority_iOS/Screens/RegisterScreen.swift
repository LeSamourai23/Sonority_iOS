//
//  RegisterScreen.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct RegisterScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        GeometryReader{geo in
            
        
            ZStack {
                Image("RegisterBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:geo.size.width, height:geo.size.height, alignment: .top)
                    .opacity(1)
                
                VStack(spacing: 60) {
                    VStack(spacing: 5) {
                        Text("Create new account")
                            .foregroundColor(.white)
                            .font(.system(size:25, weight: .bold, design: .rounded))
                        
                        Text("Please fill in the form to continue")
                            .foregroundColor(.gray)
                            .font(.system(size:18, design:.rounded))
                    }
                    
                    VStack(spacing: 10) {
                        InputView(text:$email, title: email, placeholder:"Email")
                            .autocapitalization(.none)
                        InputView(text:$fullname, title: fullname, placeholder:"Full Name")
                        InputView(text:$password, title: password, placeholder:"Password", isSecureField: true)
                        InputView(text:$confirmPassword, title: confirmPassword, placeholder:"Confirm Password", isSecureField: true)
                    }
                    
                    VStack(spacing: 30) {
                        Button {
                            Task{
                                try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                            }
                        } label:{
                            Text("Sign Up")
                                .bold()
                                .frame(width: 360, height: 70)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [butColor, lgColor]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
                                )
                                .foregroundColor(.white)
                        }
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1 : 0.5)

  //4a5cff 7c4dff
                        HStack{
                            Text("Have an Account?")
                                .foregroundColor(.white)
                            
                            Button{
                                dismiss()
                            } label:{
                                    Text("Sign In")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                    
                                }
                                .navigationBarBackButtonHidden(true)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension RegisterScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
