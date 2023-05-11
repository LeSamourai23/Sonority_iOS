//
//  LoginScreen.swift
//  Sonority
//
//  Created by Ayaan on 11/05/23.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        NavigationStack{
            GeometryReader{geo in
                ZStack{
                    Image("LoginBG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width:geo.size.width, height:geo.size.height, alignment: .top)
                        .opacity(1)
                    
                    VStack{
                        VStack{
                            Image("Logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width:250, height:60, alignment: .center)
                                .edgesIgnoringSafeArea(.all)
                                .opacity(1.0)
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 180)
                        
                        VStack(spacing:30){
                            VStack{
                                InputView(text:$email, title: email, placeholder:"Email")
                                    .autocapitalization(.none)
                                InputView(text:$password, title: password, placeholder:"Password", isSecureField: true)
                            }
                            
                            VStack(spacing: 20){
                                
                                //Sign In Button
                                Button{
                                    Task{
                                        try await viewModel.signIn(withEmail: email, password: password)
                                    }
                                } label:{
                                    Text("Login")
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
                                HStack{
                                    Text("Don't Have an Account?")
                                        .foregroundColor(.white)
                                    
                                    NavigationLink{
                                        RegisterScreen()
                                    } label:{
                                            Text("Sign Up")
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
    }
}

extension LoginScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
    
struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
