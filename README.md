<img src="https://img.shields.io/badge/c0m4-02569B?style=for-the-badge&logo=flutter&logoColor=white">
<img src="https://img.shields.io/badge/cutesangrok-0175C2?style=for-the-badge&logo=dart&logoColor=white">
---

## [Dart 기초] 개인 과제 - 콘솔 쇼핑몰

### 1️⃣ **Intro : 과제 시나리오**

#### 시나리오

<aside>
🗣 아래의 기능이 들어있는 콘솔 프로그램 만들기

- 판매하는 상품 목록을 볼 수 있는 기능
- 구매자가 구매하고 싶은 상품들을 장바구니에 담을 수 있는 기능
- 구매자가 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능
</aside>

### 필수 정의

#### **쇼핑몰**을 정의하기 위한 `ShoppingMall` 클래스

- **속성**
    - 판매하는 상품 목록 (`List<Product>`)
    - 장바구니에 담은 상품들의 총 가격 (`int`)
- **메서드**
    - 상품 목록을 출력하는 메서드 (`showProducts()`)
    - 상품을 장바구니에 담는 메서드 (`addToCart()`)
    - 장바구니에 담은 상품의 총 가격을 출력하는 메서드 (`showTotal()`)

---

#### **상품**을 정의하기 위한 `Product` 클래스

- **속성**
    - 상품 이름 (`String`)
    - 상품 1개당 가격 (`int`)

---

필수 구현 완료
