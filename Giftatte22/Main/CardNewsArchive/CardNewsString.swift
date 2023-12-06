//
//  Strings.swift
//  Giftatte22
//
//  Created by duck on 2022/04/20.
//

import Foundation


//Main에서 사용될 문자열
struct Strings{
    
 
    //Survey
    var itemNameList0: [String] = ["옷", "신발/시계", "전자제품", "책"]
    var itemNameList1: [String] = ["옷", "신발/시계", "화장품", "상품권"]
    var itemNameList2: [String] = ["전자제품", "인테리어소품", "출산육아템", "생활용품"]
    var itemNameList3: [String] = ["전자제품", "생활용품", "상품권", "책"]
    var itemNameList4: [String] = ["시계/신발", "전자제품", "생활용품", "상품권"]
}

enum CardNewsTitle: String{
    case fifty = "50대 부모님 추천 선물"
    case twentyWoman =  "20대 여자 추천 선물"
    case twentyMan = "20대 추천 선물"
    case useless = "쓸모없는 선물 Top9"
    case summer = "여름 필수템 선물"
}

enum CardNewsContent: String{
    case fifty = "현금말고 부모님이 좋아하는 선물 어때이가 추천해드려요"
    case twentyWoman =  "특별한 날 친구의 선물 어때이가 추천해드려요"
    case twentyMan =  "고르기 어려운 남자 선물 어때이가 추천해드려요"
    case useless = "뭘 선물해 줄 지 모르겠다면 이건 어때이?"
    case summer = "시원하게 여름을 보내기위한 필수템 어때이가 추천해드려요"
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


