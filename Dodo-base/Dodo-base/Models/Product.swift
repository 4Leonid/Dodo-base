//
//  Product.swift
//  DodoPizza
//
//  Created by Леонид Турко on 05.10.2024.
//

import UIKit

struct Product {
  let pizzaImage: String
  let pizzaName: String
  let pizzaDetails: String
  let pizzaPrice: String
}

final class ProductFactory {
  func getProduct() -> [Product] {
     products
  }
}

private let products: [Product] = [
  Product(
    pizzaImage: "beef",
    pizzaName: "Мясная",
    pizzaDetails: "Пряная говядина, шампиньоны, ароматный грибной соус, маринованные огурчики, моцарелла, красный лук, фирменный соус альфредо",
    pizzaPrice: "от 499 ₽"
  ),
  Product(
    pizzaImage: "befstroganov",
    pizzaName: "Бефстроганов",
    pizzaDetails: "Пряная говядина, шампиньоны, ароматный грибной соус, маринованные огурчики, моцарелла, красный лук, фирменный соус альфредо",
    pizzaPrice: "от 499 ₽"
  ),
  Product(
    pizzaImage: "cheese",
    pizzaName: "Сырная",
    pizzaDetails: "Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо",
    pizzaPrice: "от 299 ₽"
  ),
  Product(
    pizzaImage: "chiken",
    pizzaName: "Двойной ципленок",
    pizzaDetails: "Цыпленок, моцарелла, фирменный соус альфредо",
    pizzaPrice: "от 409 ₽"
  ),
  Product(
    pizzaImage: "chorizo",
    pizzaName: "Чоризо",
    pizzaDetails: "Острые колбаски чоризо , сладкий перец , моцарелла, фирменный томатный соус",
    pizzaPrice: "от 299 ₽"
  ),
  Product(
    pizzaImage: "dodomix",
    pizzaName: "Додо микс",
    pizzaDetails: "Бекон , цыпленок , ветчина , сыры чеддер и пармезан , соус песто, кубики брынзы , томаты , красный лук , моцарелла, фирменный соус альфредо, чеснок , итальянские травы ",
    pizzaPrice: "от 499 ₽"
  ),
  Product(
    pizzaImage: "ham&cheese",
    pizzaName: "Ветчина и сыр",
    pizzaDetails: "Ветчина, моцарелла, фирменный соус альфредо",
    pizzaPrice: "от 409 ₽"
  ),
  Product(
    pizzaImage: "mashrooms",
    pizzaName: "Жюльен",
    pizzaDetails: "Цыпленок, шампиньоны, ароматный грибной соус, лук, сухой чеснок, моцарелла, смесь сыров чеддер и пармезан, фирменный соус альфредо",
    pizzaPrice: "от 519 ₽"
  ),
  Product(
    pizzaImage: "peperoni",
    pizzaName: "Пеперони фреш",
    pizzaDetails: "Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус",
    pizzaPrice: "от 329 ₽"
  ),
  Product(
    pizzaImage: "pesto",
    pizzaName: "Песто",
    pizzaDetails: "Цыпленок, соус песто, кубики брынзы, томаты, моцарелла, фирменный соус альфредо",
    pizzaPrice: "от 539 ₽"
  ),
  Product(
    pizzaImage: "shrimp",
    pizzaName: "Креветки со сладким чили",
    pizzaDetails: "Креветки, ананасы, соус сладкий чили, сладкий перец, моцарелла, фирменный соус альфредо",
    pizzaPrice: "от 549 ₽"
  ),
  ]
