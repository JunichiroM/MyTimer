//
//  ContentView.swift
//  MyTimer
//
//  Created by apple on 2024/09/20.
//

import SwiftUI

struct ContentView: View {
    //タイマーの変数を作成
    @State var timerHandler : Timer?
    //カウント（経過時間）の変数を作成
    @State var count = 0
    //永続化する秒数設定（初期値は10）
    @AppStorage("timer_value") var timerValue = 10
    //アラート表示有無
    @State var showAlert = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(spacing:30.0){
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    
                    HStack{
                        Button{
                            startTimer()
                        }label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width:140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        
                        Button{
                            //timerHandlerをアンラップしてunwrappedTimeHandlerに代入
                            if let unwrappedTimeHandler = timerHandler{
                                if unwrappedTimeHandler.isValid == true{
                                    unwrappedTimeHandler.invalidate()
                                    
                                }
                            }
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
            //画面が表示される時に実行される
            .onAppear{
                //カウント（経過時間）の変数を初期化
                count = 0
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
            
            .alert("終了", isPresented: $showAlert){
                Button("OK"){
                    //OKをタップしたときに実行される
                    print("OKタップされたよ")
                }
            }message: {
                Text("タイマー終了時間です")
            }
        }
    }
    
    //1秒毎に実行されてカウントダウンする
    func countDownTimer(){
        count += 1
        
        if timerValue - count <= 0{
            //タイマー停止
            timerHandler?.invalidate()
            
            //アラート表示する
            showAlert = true
        }
    }
    
    //タイマーをカウントダウン開始する関数
    func startTimer(){
        //timerHandlerをアンラップしてunwrappedTimerHandlerに代入
        if let unwrappedTimerHandler = timerHandler{
            //もしタイマーが実行中だったらスタートしない
            if unwrappedTimerHandler.isValid == true{
                //何も処理しない
                return
            }
        }
        
        //残り時間が0以下のとき、count(経過時間)を0に初期化する
        if timerValue - count <= 0{
            //count(経過時間)を0に初期化する
            count = 0
        }
        
        //タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            //タイマー実行時に呼び出される
            //1秒毎に実行されてカウントダウンする関数を実行する
            countDownTimer()
        }
    }
}

#Preview {
    ContentView()
}
