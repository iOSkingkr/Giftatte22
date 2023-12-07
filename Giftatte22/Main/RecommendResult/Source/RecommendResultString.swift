//
//  RecommendResultString.swift
//  Giftatte22
//
//  Created by duck on 2023/12/06.
//

import Foundation

enum RecommendResultTitle: String{
    case fifty = "50대 부모님 추천 선물"
    case twentyWoman =  "20대 여자 추천 선물"
    case twentyMan = "20대 추천 선물"
    case useless = "쓸모없는 선물 Top9"
    case summer = "여름 필수템 선물"
}

enum RecommendResultTopHashTag: String{
    case fifty = "#요즘_부모님들_이거_좋아해"
    case twentyWoman =  "#언니_이거_어디꺼에요??"
    case twentyMan =  "#훈훈함_장착가능_아이템"
    case useless = "#내돈내산_절대_안함"
    case summer = "#더우니_시원한_선물ㄱㄱ"
}

enum RecommendResultBottomHashTag: String{
    case fifty = "#만족_100프로_부모님선물"
    case twentyWoman =  "#여친이_좋아할_만한선물"
    case twentyMan =  "#남친이_좋아할_만한선물"
    case useless = "#내친구에게_찰떡_아이템ㅋㅋ"
    case summer = "#HOT_여름_필수템"
}
