import 'dart:convert';
import 'dart:io';
import 'package:dart_application_1/product.dart';
import 'package:dart_application_1/shopping_mall.dart';

//[dart run bin/main.dart] <= 실행하기 (TERMINAL)
void main() {
  // 상품 목록
  List<Product> products = [
    //(소문자)product라는 리스트에 상품 목록을 넣고 이 리스트에는 (대문자)Product 객체들만 들어갈 수 있음
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  ShoppingMall mall = ShoppingMall(
      products); //Shoppingmall이라는 클래스로 mall객체를 만듬, 만들 때 peoduct 리스트를 넣어줌

  bool running = true; //프로그램을 실행 true는 실행중 종료를 하면 false가 된다

  print('쇼핑몰에 오신 것을 환영합니다!'); //어서오세요 같은 말 출력

  while (running) {
    //프로그램이 실행 중일 때 계속 반복
    print('\n==== 메뉴 ====👇'); //메뉴 리스트 목록
    List<String> menu = [
      '[1] 상품 목록 보기',
      '[2] 장바구니에 담기',
      '[3] 장바구니 총 가격 보기',
      '[4] 종료',
      '[6] 장바구니 비우기',
    ];

    for (var item in menu) {
      // menu 리스트 안에 각 항목을 하나씩 item이란 변수에 저장
      print(item); //그 item을 출력해서 보여줌
      // print(); 를 사용해서 만들면 print('[1]...'), print('[2]...')...이렇게 하나씩 다 써야함, 그리고 메뉴(위 List부분)를 추가하기 쉬움
    }
    stdout.write('번호 입력 : '); // 입력창, 사용자의 입력을 같은 줄에 받기위해 사용, 사용자가 볼 때 보기 편함
    String? input = stdin.readLineSync(); //print를 사용하면 줄이 바뀜
    //null(?)을 사용한 이유는 아무 입력을 받지 않았을 때 입력이 유효한지 확인하기 위해 사용

    switch (input) {
      //swich 보다 if else를 먼저 사용해봤는데 상당히 복잡하고 오류를 수정하기 어려웠음
      case '1':
        mall.showProducts(); //shoppingmall 클래스에 있는 상품 목록을 보여줌
        break;

      case '2':
        stdout.write('상품 이름 입력 : '); //사용자에게 입력해달라고 함, 위와 같이 같은 줄에 입력
        String? name = //상품 이름 입력 받기
            stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
        stdout.write('수량 입력 : '); // 사용자에게 상품 수량 입력 요청
        String? qty = stdin.readLineSync(); //상품 수량 입력 받음

        if (name == null || qty == null) {
          //입력 값이 비었는지 확인
          print('입력이 잘못되었습니다.');
          break;
        }

        int? quantity = int.tryParse(qty); //문자로 입력된 수량을 숫자로 바꿈

        if (quantity == null) {
          //만약 변환 실패시 오류메세지 출력
          print('입력값이 올바르지 않아요 !');
          break;
        }

        mall.addToCart(name, quantity);
        break;

      case '3':
        mall.showTotal(); // 장바구니에 입력된 목록 및 가격 보여주기
        break;

      case '4':
        stdout.write('정말 종료하시겠습니까? 종료하시려면 [5]을 입력하세요: '); // 진짜 종료할껀지 물어보기
        String? confirm = stdin.readLineSync(); //확인용 입력

        if (confirm == '5') {
          //만약에 5를 입력했다 = 안녕히가세요
          print('이용해주셔서 감사합니다! 안녕히 가세요!');
          running = false; //프로그램 루프 방지
        } else {
          //만약 다른 키를 누르면 종료안함
          print('종료하지 않습니다.');
        }
        break;

      case '6':
        print(
            '정말 장바구니를 비우시겠습니까? 비우려면 [6]을, 취소하려면 아무 키나 누르세요.'); // 일단 진짜 비울건지 물어봄
        stdout.write('입력: '); //한줄에 입력 받음
        String? confirm = stdin.readLineSync(); //응답 받기

        if (confirm == '6') {
          //진짜 비울건지 확인
          mall.clearCart(); //장바구니 비우기 시작
        } else {
          //6이 아닌 다른걸 누르면 취소
          print('장바구니 비우기를 취소했습니다.');
        }
        break; //끼익

      default: //위에 있는 보기버튼(1,2,3,4,5,6)이외에 다른 버튼을 누르면 잘못된 메세지 출력
        print('지원하지 않는 기능입니다! 다시 시도해 주세요.');
    }
  }
}
