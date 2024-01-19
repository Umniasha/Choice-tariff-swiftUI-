    //
    //  ContentView.swift
    //  InternshipTestApp
    //
    //  Created by Oleg Arnaut  on 15.01.2024.
    //

    import SwiftUI

    struct ContentView: View {
       
        @StateObject var localData = LocalData()
        @State private var enabledPost : String?
        @State private var showAlert = false
        private var message : String {
            if enabledPost != nil {
                var result : String = ""
                if let posts = localData.allResult?.result.list {
                    for post in posts{
                        if post.id == enabledPost {
                            result = post.title
                        }
                    }
                }
                  return result
            }
            return "fdsf"
            
        }
        
        var body: some View {
            ZStack{
                
                    
                VStack{
                    VStack{
                       
                        Button {
                            print("by by")
                        } label: {
                            Image("Close")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .topLeading)
                            .padding(.bottom, 15)
                        
                        Text(localData.allResult?.result.title ?? "")
                            .font(.system(size: 27))
                            .fontWeight(.bold)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .topLeading)
                            
                    }
                    .padding(.leading, 5)
                    
                  
                    ScrollView {
                        if let date = localData.allResult{
                            ForEach(0..<date.result.list.count ) { i in
                                if date.result.list[i].isSelected {
                                VStack {
                                 
                                    HStack(alignment: .top, spacing: 20){

                                        AsyncImage(url: URL(string: date.result.list[i].icon))
                                            .frame(width: 52, height: 52)


                                        VStack(alignment: .leading, spacing: 5){
                                            Text(date.result.list[i].title)
                                                .font(.system(size: 21))
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.leading)
                                                
                                            if let descriptionText = date.result.list[i].description {
                                                Text(descriptionText)
                                                    .font(.system(size: 15))
                                                    .fontWeight(.regular)
                                                    .frame( alignment: .leading)
                                                    .multilineTextAlignment(.leading)
                                                Divider()
                                            } else {
                                               
                                                Divider()
                                            }
                                            

                                            Text(date.result.list[i].price)
                                                .font(.system(size: 21))
                                                .fontWeight(.bold)

                                        }
                                        .foregroundColor(Color.black)
                                        if date.result.list[i].id == enabledPost{
                                            Image("checkmark").padding(15).opacity(1)
                                        } else {
                                            Image("checkmark").padding(15).opacity(0)
                                        }
                                        
                                    }
                                    .padding()
                                        
                                }
                                    .background(Color.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .onTapGesture {
                                        if enabledPost == nil {
                                            enabledPost = date.result.list[i].id
                                           
                                        } else if enabledPost == date.result.list[i].id {
                                            enabledPost = nil
                                           
                                        } else {
                                            enabledPost = date.result.list[i].id
                                            
                                        }
                                        
                                      }


                                }
                            }
                        }
                        
                    }
                    
                        Button(localData.allResult?.result.selectedActionTitle ?? "select") {
                            if enabledPost != nil {
                                showAlert = true
                            }
                          
                        }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom, 5)
                            //.disabled(true)
                            .alert(isPresented: $showAlert) {
                              
                               
                                Alert(title: Text("Вы выбрали тариф  \n \(message)"), primaryButton: .default(Text("OK")){
                                    print("kek")
                                },
                                              secondaryButton: .cancel(Text("Отмена")) )
                                    }
                        
                  
                            
                }
                .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))             //end of VStack
            }                       //end of ZStack
        }
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

