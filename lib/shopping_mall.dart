import 'product.dart';

class ShoppingMall {
  final List<Product> products; //상품 목록
  int _totalPrice = 0; //장바구니 총 가격 저장

  ShoppingMall(this.products); //생성자

  void showProducts() {
    //쇼핑몰 안의 상품 목록을 보여주는 함수
    for (var product in products) {
      //products 리스트에 있는 상품들을 하나씩 꺼내서 product라는 변수에 담고 반복
      print('${product.name} / ${product.price}원'); //상품의 이름과 가격을 출력
    }
  }

  void addToCart(String name, int quantity) {
    //이름, 개수가 맞는지 확인 후 장바구니에 추가
    final matched = products.firstWhere(
      (p) => p.name == name.trim(),
      orElse: () => Product('', 0),
    );
    //products 리스트에서 name과 같은 이름을 가진 상품을 찾음
    //공백 제거를 위해 name.trim() 사용
    //못 찾으면 임시로 Product('', 0)를 반환해서 아래에서 처리할 수 있게 함

    if (matched.name == '') {
      print('입력값이 올바르지 않아요 !');
      return;
    }
    //상품 이름이 빈 문자열이라면 → 존재하지 않는 상품이므로 오류 메시지를 보여주고 함수 종료

    if (quantity <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      return;
    }
    //장바구니에 1개 이상만 담을 수 있음, 0이나 음수를 넣으면 오류 메시지 출력 후 종료

    _totalPrice += matched.price * quantity;
    print('장바구니에 상품이 담겼어요 !');
  }
  //상품 가격 × 개수를 계산해서 _totalPrice에 더함, 이 _totalPrice는 장바구니 전체 가격

  void showTotal() {
    print('장바구니에 ${_totalPrice}원 어치를 담으셨네요 !'); //성공 메세지
  }
}
