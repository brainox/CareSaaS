//
//  LoginView.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: LoginViewModel
    
    // MARK: - View
    
    var body: some View {
        if viewModel.isSignedIn {
            MainView()
        } else {
            loginContent
        }
        
    }
    
    var loginContent: some View {
        ZStack {
            Color.white
            VStack {
                Spacer()
                mainContent
                Spacer()
                Text(termsAndConditions)
                    .multilineTextAlignment(.center)
            }
            .padding(.all, 16)
            if viewModel.isSigningIn {
                ZStack {
                    Color(white: 1.0)
                        .opacity(0.75)
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    var mainContent: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Welcome back!👋")
                    .apply(theme: .labelPrimaryTitle)
                    .padding(.bottom, 8)
                Text("Fill your details to get started")
                    .apply(theme: .bodyHighEmphasisRegularSize16)
                    .padding(.bottom, 56)
                VStack {
                    textFields
                    rememberMeForgetPassword
                    signInButton
                    contactSupport
                }
            }
        }
    }
    
    var textFields: some View {
        VStack {
            InputField(title: "Username", validationText: "Username must be at least 4 characters long", text: $viewModel.username, textFieldState: $viewModel.usernameState)
                .padding(.bottom, 16)
            SecureInputField(title: "Password", validationText: "Password must be at least 8 characters long", text: $viewModel.password, textFieldState: $viewModel.passwordState, isShowingPassword: $viewModel.isSecured)
        }
        .disabled(viewModel.isSigningIn)
        .padding(.bottom, 24)
    }
    
    var rememberMeForgetPassword: some View {
        HStack {
            Toggle(isOn: $viewModel.isChecked) {
                Text("Remember me")
                    .apply(theme: .bodyMediumPrimaryEmphasis)
            }
            .toggleStyle(CheckedboxToggleStyle())
            Spacer()
            Button {} label: {
                Text("Forgot Password?")
                    .apply(theme: .backgroundRed)
            }
        }
    }
    
    private var signInButton: some View {
        Button {
            viewModel.signIn()
        } label: {
            Text("Sign in")
                .apply(theme: TextTheme.bodyWhiteSolid)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(viewModel.isValidLoginForm ? Color(.primaryHighEmphasis) : Color(.primaryDisabled))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .disabled(!viewModel.isValidLoginForm)
        .padding(.bottom, 24)
        .padding(.top, 32)
        .alert(viewModel.error?.localizedDescription ?? "Error", isPresented: Binding(value: $viewModel.error)) {
            Button("OK"){}
        }
    }
    
    var contactSupport: some View {
        HStack {
            Text(styledString)
        }
    }
    
    let styledString = makeAttributedString("Don't have an account? Contact Support", for: ["Contact Support"])
    
    let termsAndConditions = makeAttributedString("By clicking ‘Sign in’ above you agree to Arocare’s Terms & Conditions and Privacy Policy.", for: ["Terms & Conditions", "Privacy Policy."])
}

//#Preview {
//    LoginView()
//}
