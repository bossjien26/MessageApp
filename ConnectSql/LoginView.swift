//
//  ContentView.swift
//  ConnectSql
//
//  Created by 王復儀 on 2022/8/8.
//

import SwiftUI

struct LoginView: View {

    @State var username: String = ""
    @State var password: String = ""
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var controller = SignInController()
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom, 75)
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: ContentView(),
                    isActive: $isActive, // 绑定isActive
                    label: {
                        Button("Login")
                        {
                            Task {
                                self.isActive = await controller.request(account: self.username, password: self.password)
                                
                                print(self.isActive)
                            }
                        }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                )
//                onTapGesture
//test
                
//                Button {
//                    self.isActive = controller.request(account: self.username, password: self.password)
//                } label: {
//                    Text("LOGIN")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 220, height: 60)
//                    .background(Color.green)
//                    .cornerRadius(15.0)
//                    .tag("Home")
//                }
            }
//            .padding()
//            HStack{
//                VStack {
//                    Button {controller.request()} label: {
//                        Text("Get Students")
//                            .font(.largeTitle)
//                            .multilineTextAlignment(.leading)
//                            .lineLimit(1)
//                    }
//                    .buttonStyle(.borderedProminent)
//
//
//
//                    NavigationLink {
//                        HomePage()
//                    } label: {
//                        Text("對的時間點")
//                            .font(.largeTitle)
//                    }.buttonStyle(.bordered)
//                    .buttonBorderShape(.capsule)
                        
//                    
//                    Button {} label: {
//                        Text("Home")
//                        .font(.largeTitle)
//                    }
//                    .buttonStyle(.bordered)
//                    .buttonBorderShape(.capsule)
//                    
                    
//                }
//            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
//        var isActived:Bool = false;
//        var homeController = HomePageController()

        LoginView()
    }
}
