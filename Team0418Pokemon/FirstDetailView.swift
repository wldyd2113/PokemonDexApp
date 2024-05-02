//
//  FirstDetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct FirstDetailView: View {
    @StateObject private var detailModel = DetailModel(service: MockService())
    var id: Int
    var idToSend: Int // PkmImgView에서 사용할 id 값
    @State var pkmtype: PokemonType = .fire
    @State var genus = "Lizard Pokemon"
    @State var name = "파이리"
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack{
                        ZStack{
                            Capsule() //타원
                                .fill(Color.black)
                                .frame(width:90, height: 30)
                            if(detailModel.pokeDtail.id != 0) {
                                Text("No.\(id)")
                                    .foregroundStyle(.white)
                                    .font(.footnote)
                            }
                            else {
                                Text("Number Error")
                            }
                            
                        }
                        ZStack {
                            Capsule() //타원
                                .fill(Color(UIColor(hex: pkmtype.DisplayColorName())))
                                .frame(width:90, height: 30)
                            if(detailModel.pokeDtail.id != 0 ){
                                Text(detailModel.pokeDtail.type.rawValue).foregroundStyle(.white)
                            }
                        }
                    }
                    if(detailModel.pokeDtail.id != 0){
                        Text(detailModel.pokeDtail.name)
                            .font(.largeTitle)
                    }
                    if(detailModel.pokeDtail.id != 0){
                        Text(detailModel.pokeDtail.genus)
                            .font(.footnote)
                    }
                    
                }
                
            }
                
        }
        .task {
            await detailModel.loadDetail(width: idToSend) // 포켓몬의 id를 전달하여 해당 포켓몬의 상세 정보를 가져옴
        }
        
    }
}

#Preview {
    FirstDetailView(id: 1, idToSend: 1)
}
