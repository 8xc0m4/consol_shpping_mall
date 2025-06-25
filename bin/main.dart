import 'dart:io'; //dart에서 제공하는 입출력 기능 사용
import '../lib/product.dart'; //product파일 불러오기
import '../lib/shopping_mall.dart'; //shopping_mall파일 불러오기

//[dart run bin/main.dart] <= 실행하기 (TERMINAL)
void main() {
  //메인 함수
  final mall = ShoppingMall([
    // ShoppingMall이라는 클래스를 사용해서 mall이라는 쇼핑몰 객체를 하나 만듬, final은 한 번만 값을 정할 수 있는 변수
    Product('셔츠', 45000), // 상품 리스트
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ]);

  bool running = true; //running이라는 변수를 만들었음, true는 프로그램이 계속 실행중, 종료하면 false

  print('🛒 쇼핑몰에 오신 걸 환영합니다!');

  while (running) {
    //running이 true인 동안 계속 반복
    print(
        '\n--------------------------------------------------------------------------------------------');
    print(
        '\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(
        '\n--------------------------------------------------------------------------------------------');
    stdout.write('원하는 기능의 번호를 입력하세요: '); //콘솔에서 사용자에게 입력을 받는 부분
    final input = stdin.readLineSync(); //사용자가 입력한 문자를 읽음

    switch (input) {
      //입력 받은 값에 따라 각 작업 실행
      case '1': //상품 목록 보여주기
        mall.showProducts();
        break;
      case '2': //상품 이름, 개수를 입력받고 장바구니에 담음-----에러남(상품을 입력하고 어떤 개수를 입력하든 입력값이 올바르지 않다고 함)
        stdout.write('상품 이름을 입력하세요: ');
        final name = stdin.readLineSync();
        stdout.write('상품 개수를 입력하세요: ');
        final quantityInput = stdin.readLineSync();

        if (name == null || quantityInput == null) {
          print('입력값이 올바르지 않아요 !');
          break;
        }

        try {
          final quantity = int.parse(quantityInput);
          mall.addToCart(name, quantity);
        } catch (e) {
          print('입력값이 올바르지 않아요 !');
        }
        break;
      case '3': //장바구니에 담긴 상품들의 총 가격 알려줌
        mall.showTotal();
        break;
      case '4': //종료버튼, running이 false가 됨
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        running = false;
        break;
      default: //다른 번호 입력시 오류문자 출동
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
