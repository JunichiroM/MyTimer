//
//  ContentView.swift
//  MyTimer
//
//  Created by apple on 2024/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(spacing:30.0){
                    Text("残り30秒")
                        .font(.largeTitle)
                    
                    HStack{
                        Button{
                            
                        }label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width:140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        
                        Button{
                            
                        }label: {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            //ナビゲーションバーの右にボタンを追加
            .toolbar{
                //ナビゲーションバーの右にボタンを追加
                ToolbarItem(placement: .navigationBarTrailing){
                    //ナビゲーション遷移
                    NavigationLink{
                        SettingView()
                        
                    }label:{
                        //テキストを表示
                        Text("秒数設定")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
