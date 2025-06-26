import 'product.dart'; //Product에게 상품 정보를 가져오게 하는 징검다리

class ShoppingMall {
  //shoppingmall클래스 정의
  final List<Product> products; // 상품 목록은 앱 실행중 바뀌지 않으니 final로 지정
  int totalPrice = 0; // 장바구니 총 가격 저장
  List<String> cartItems = []; // 장바구니 상품 이름 목록

  ShoppingMall(this.products); //main에 상품목록을 넘김

  void showProducts() {
    //쇼핑몰 안의 상품 목록을 보여주는 함수
    for (var product in products) {
      //목록애 있는걸 하나씩 꺼냄
      print('${product.name} / ${product.price}원'); //상품 이름과 가격을 포멧에 맞게 출력
    }
  }

  void addToCart(String name, int quantity) {
    //이름, 개수가 맞는지 확인 후 장바구니에 추가
    final matched = products.firstWhere(
      //일치하는 상품 찾기
      (p) => p.name == name.trim(), //공백 포함 잘못된 입력 방지 "trim()"
      orElse: () => Product(
          '', 0), //못 찾으면 임시로 Product('', 0) = (빈상품) 를 반환해서 아래에서 처리할 수 있게 함
    );

    if (matched.name == '') {
      //일치하는 상품이 없으면 경고메세지 출동
      print('입력값이 올바르지 않아요 !');
      return; //다시
    }

    if (quantity <= 0) {
      //수량이 0개 이하면 오류메세지 출동
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      return;
    }

    totalPrice += matched.price * quantity; //상품 가격*수량만큼 총 금액에 더하기
    cartItems.add('${matched.name} x$quantity'); //장바구니에 있는것들의 이름과 수량을 알려줌
    print('장바구니에 상품이 담겼어요 !');
  }

  void showTotal() {
    //장바구니 목록과 총 가격을 보여주는 기능
    if (cartItems.isNotEmpty) {
      //장바구니에 상품이 1개 이상이면 '상품이름'과 총 가격을 출력
      print(
          '장바구니에 ${cartItems.join(', ')}가 담겨있어요 ! 총 ${totalPrice}원 어치를 담으셨네요 !');
      print('장바구니를 비우시려면 [6]을 눌러주세요.');
    } else {
      //없으면 비었다고 알려줌
      print('장바구니가 비어있습니다.');
    }
  }

  void clearCart() {
    //장바구니 비우는 기능
    if (cartItems.isNotEmpty) {
      //장바구니가 비어있지 않을 때만 비우기 수행
      cartItems.clear(); //상품 목록과
      totalPrice = 0; //총 가격을 초기화
      print('장바구니를 초기화합니다.');
    } else {
      //상품이 하나도 없으면 비었다고 알려줌
      print('이미 장바구니가 비어있습니다.');
    }
  }
}
