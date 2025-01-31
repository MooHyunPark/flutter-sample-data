import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/user_info_vm.dart';


class UserInfoBody extends StatelessWidget {
  final UserInfoModel userInfoModel;

  UserInfoBody({required this.userInfoModel});

  @override
  Widget build(BuildContext context) {
    String userWeight;
    String userHeight;

    if (userInfoModel.weight == null || userInfoModel.weight == 0) {
      userWeight = "등록된 정보가 없습니다.";
    } else {
      userWeight = userInfoModel.weight.toString() + "kg";
    }
    if (userInfoModel.height == null || userInfoModel.height == 0) {
      userHeight = "등록된 정보가 없습니다.";
    } else {
      userHeight = userInfoModel.height.toString() + "cm";
    }


    return SingleChildScrollView(
      child: Container(
        width: double.infinity, // 부모 Container의 너비를 최대화합니다.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column의 크기를 자식 크기로 제한합니다.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // 수평 방향 가운데 정렬
          children: [
            SizedBox(height: 100,),
            InkWell(
                onTap: () {
                  print("회원 정보 수정 버튼 클릭됨");
                },
                child: UserInfoBodyWidget(text: "회원 정보 수정하기", fontSize: 35,)),
            SizedBox(height: 200,),
            UserInfoBodyWidget(text: "신장 : $userHeight", fontSize: 30,),
            SizedBox(height: 50,),
            UserInfoBodyWidget(text: "몸무게 : $userWeight", fontSize: 30,),
            SizedBox(height: 50,),
            InkWell(
              onTap: () {
                print("로그아웃 버튼 클릭됨");
              },
                child: UserInfoBodyWidget(text: "로그 아웃", fontSize: 30,)),
          ],
        ),
      ),
    );
  }


}

class UserInfoBodyWidget extends StatelessWidget {
  String text;
  double fontSize;

  UserInfoBodyWidget({
    required this.text, this.fontSize = 20
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        "${text}",
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center, // 이 부분을 추가하여 텍스트를 가운데 정렬합니다.
      ),
    );
  }

}
