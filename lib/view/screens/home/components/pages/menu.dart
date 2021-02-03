import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/data/models/product_pretty.dart';
import 'package:md3/logic/blocs/category_bloc/bloc.dart';
import 'package:md3/logic/blocs/category_bloc/state.dart';
import 'package:md3/data/models/product.dart';
import 'package:md3/view/components/animation/delayed_animation.dart';
import 'package:md3/view/components/animation/my_blur_page.dart';
import 'package:md3/view/screens/details/details_page.dart';

// Страница "Меню"
class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // При открытии меню всегда показывать товары нулевой категории
    context.bloc<CategoryBloc>().setType('0');
    return Container(
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Список категорий (CustomTabBar)
          CustomTabBar(),
          // Список продуктов (TabBarView)
          Expanded(
            child: BlocBuilder<CategoryBloc, ProductState>(
              builder: (BuildContext context, state) {
                // Показать список по категории
                if (state is SetCategoryProductState) {
                  return ProductsList(
                    key: UniqueKey(),
                    testState: state.productType,
                    good_products: state.products,
                  );
                }

                // Загрузка данных
                if (state is ProductsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                // Ошибка загрузки данных
                if (state is ProductsErrorState) {
                  return Center(
                    child: Text(
                      'Ошибка загрузки данных',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  );
                }

                // test: ХЗ
                return Center(
                  child: Text(
                    'ХЗ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Список категорий (CustomTabBar)
class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  // Контроллер анимации кнопок меню
  AnimationController _animationController0;
  AnimationController _animationController1;
  AnimationController _animationController2;
  // Объект анимации для цвета фона кнопок
  Animation<Color> animationColor0;
  Animation<Color> animationColor1;
  Animation<Color> animationColor2;
  // Объект анимации для цвета текста и рамки
  Animation<Color> animationColorTextAndBorder0;
  Animation<Color> animationColorTextAndBorder1;
  Animation<Color> animationColorTextAndBorder2;
  // Индекс текущего выбранного пункта меню
  int curentItem = 0;

  @override
  void initState() {
    super.initState();
    // Инициализация контроллеров анимации
    _animationController0 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    // Инициализация анимаций цвета фона
    animationColor0 = ColorTween(
      end: Color.fromARGB(255, 84, 148, 121),
      begin: Color.fromARGB(255, 96, 96, 103),
    ).animate(
      CurvedAnimation(
        parent: _animationController0,
        curve: Curves.linear,
      ),
    );

    animationColor1 = ColorTween(
      end: Color.fromARGB(255, 148, 135, 84),
      begin: Color.fromARGB(255, 96, 96, 103),
    ).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Curves.linear,
      ),
    );

    animationColor2 = ColorTween(
      end: Color.fromARGB(255, 148, 84, 84),
      begin: Color.fromARGB(255, 96, 96, 103),
    ).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.linear,
      ),
    );

    // Инициализация анимаций цвета текста и рамки
    animationColorTextAndBorder0 = ColorTween(
      end: Color.fromARGB(255, 255, 255, 255),
      begin: Color.fromARGB(160, 18, 18, 31),
    ).animate(
      CurvedAnimation(
        parent: _animationController0,
        curve: Curves.linear,
      ),
    );

    animationColorTextAndBorder1 = ColorTween(
      end: Color.fromARGB(255, 255, 255, 255),
      begin: Color.fromARGB(160, 18, 18, 31),
    ).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Curves.linear,
      ),
    );

    animationColorTextAndBorder2 = ColorTween(
      end: Color.fromARGB(255, 255, 255, 255),
      begin: Color.fromARGB(160, 18, 18, 31),
    ).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.linear,
      ),
    );

    // По умолчанию выбран первый элемент
    selectItem(0);
  }

  @override
  void dispose() {
    _animationController0.dispose();
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  void selectItem(int index) {
    curentItem = index;
    curentItem == 0
        ? _animationController0.forward()
        : _animationController0.reverse();

    curentItem == 1
        ? _animationController1.forward()
        : _animationController1.reverse();

    curentItem == 2
        ? _animationController2.forward()
        : _animationController2.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Верхний отступ, равный верхнему отступу логотипа в левом блоке
      // минус половина разницы их высот
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
      child: SizedBox(
        height: 53, // Высота, равная логотипу в левом блоке
        child: Container(
          // Ограничение длины меню
          constraints: BoxConstraints(maxWidth: 500),
          child: Stack(
            children: [
              // Напитки
              Padding(
                // Микро-отступ, что бы пофиксить аномалию с рамкой в левой части меню:
                padding: const EdgeInsets.only(left: 1),
                child: AnimatedBuilder(
                  animation: _animationController2,
                  builder: (context, child) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              selectItem(2);
                              context.bloc<CategoryBloc>().setType('2');
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: animationColorTextAndBorder2.value,
                                  width: 1.2,
                                ),
                                // 148, 84, 84
                                color: animationColor2.value, // animation value
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      // Отступ для центрирования из-за скругленных углов
                                      padding: EdgeInsets.only(right: 0), // ?
                                      child: Center(
                                        child: Text(
                                          'Напитки',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: animationColorTextAndBorder2
                                                .value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: SizedBox(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Коктейли
              Padding(
                // Микро-отступ, что бы пофиксить аномалию с рамкой в левой части меню:
                padding: const EdgeInsets.only(left: 1),
                child: AnimatedBuilder(
                  animation: _animationController1,
                  builder: (context, child) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              selectItem(1);
                              context.bloc<CategoryBloc>().setType('1');
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: animationColorTextAndBorder1.value,
                                  width: 1.2,
                                ),
                                //  148, 135, 84
                                color: animationColor1.value, // animation value
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      // Отступ для центрирования из-за скругленных углов
                                      padding: EdgeInsets.only(right: 0), // ?
                                      child: Center(
                                        child: Text(
                                          'Коктейли',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: animationColorTextAndBorder1
                                                .value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Чай
              AnimatedBuilder(
                animation: _animationController0,
                builder: (context, child) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            selectItem(0);
                            context.bloc<CategoryBloc>().setType('0');
                          },
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: animationColorTextAndBorder0.value,
                                width: 1.2,
                              ),

                              // 84, 148, 121
                              color: animationColor0.value, // animation value
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Center(
                              child: Text(
                                'Чай',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: animationColorTextAndBorder0.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Список продуктов (TabBarView)
class ProductsList extends StatefulWidget {
  final testState;
  final good_products;
  const ProductsList({Key key, this.testState, this.good_products})
      : super(key: key);
  @override
  _ProductsListState createState() =>
      _ProductsListState(testState: testState, good_roducts: good_products);
}

class _ProductsListState extends State<ProductsList> {
  final String testState; // тестовая переменная для категории товаров
  final List<ProductPretty> good_roducts;
  List<Product> roductsItems = <Product>[];

  _ProductsListState({this.testState, this.good_roducts});

  // Контроллер прокрутки списка.
  // Здесь служит для отмены анимирования элементов списка, когд пользователь начинает скролить список продуктов
  ScrollController _scrollController;

  @override
  void initState() {
    // Инициализация контроллера прокрутки списка и слушатель
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
    // // Данные с сервера
    int idx = 0; // Индекс продукта в текущем списке
    for (var e in good_roducts) {
      roductsItems.add(
        Product(
          image: e.photo,
          title: e.productName,
          subtitle: 'subtitle',
          price: e.price,
          canOrder: true,
          index: idx,
          id: e.productId,
        ),
      );
      idx++;
    }

    // // Генерация тестовых данных
    // roductsItems = List<Product>.generate(
    //   50,
    //   (i) => Product(
    //     image: "assets/images/test_products/product${(i) % 9}.png",
    //     title: i % 2 == 0
    //         ? "Сладкий грейпфрут" + testState // test
    //         : "Мелиса и Мята" + testState, // test
    //     subtitle: i % 2 == 0 ? "Фруктовый" : "Royal smoke",
    //     price: (i * i).toDouble(),
    //     canOrder: true,
    //     index: i,
    //   ),
    // );
  }

  // Слушатель прокрутки списка
  // Срабатывает при малейшей прокрутке
  _scrollListener() {
    // Пользоваель начал прокрутку списка
    wasScroll = true;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Флаг, указывающий, не начал ли пользователь прокрутку списка
  bool wasScroll = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      // color: Colors.blue, // test
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent, // test
              // constraints: BoxConstraints(maxWidth: 450), // test ?
              // 1
              child: ListView.builder(
                // physics: PageScrollPhysics(), //
                // physics: BouncingScrollPhysics(), //
                // physics: ClampingScrollPhysics(), // ?
                // physics: RangeMaintainingScrollPhysics(),
                // physics: FixedExtentScrollPhysics(), // no ?
                // physics: AlwaysScrollableScrollPhysics(),

                controller: _scrollController,
                itemCount: roductsItems.length,
                itemBuilder: (context, index) {
                  // Проверяем:
                  // 1. Не трогал ли пользователь пальцами список
                  if (!wasScroll) {
                    return DelayedAnimation(
                      aniDuration: 200,
                      aniOffsetX: 0.0,
                      aniOffsetY: 0.0,
                      delayedAnimation: 150 + 50 * index, // 2
                      child: ProductListTile2(product: roductsItems[index]),
                    );
                  } else {
                    // Без анимации
                    return ProductListTile2(product: roductsItems[index]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Элемент списка продуктов
class ProductListTile2 extends StatelessWidget {
  final Product product;
  const ProductListTile2({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Открыть карточку товара
        Navigator.push(
          context,
          createBlurRouteWithBlurBackground(Details(), '/details',
              arguments: product, context: context),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Изображение товара
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 13,
              bottom: 13,
              right: 17,
            ),
            child: Image.network(
              product.image,
              width: 82,
              height: 94,
            ),
          ),
          // 1) Во-первых, Этот Flexible добавляет гибгости дочернему контейнеру.
          // Благодаря нему длинный Заголовок товара
          // на узком экране не обрезается, а переносится:
          Flexible(
            child: Container(
              // 2) Во-вторых, указание максимальной ширины гибкого контейнера
              constraints: BoxConstraints(maxWidth: 450),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  // Заголовок товара
                  Text(
                    product.title,
                    style: TextStyle(
                      color: Color.fromARGB(255, 84, 148, 121),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Подзаголовок товара
                  Text(
                    product.subtitle,
                    style: TextStyle(
                      color: Color.fromARGB(255, 175, 175, 189),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Цена товара
                        Text(
                          '₽${product.price.toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14, // 14
                            height: 2.4,
                          ),
                        ),
                        // Заказать товар
                        product.canOrder
                            ? Image.asset(
                                'assets/icons/icon_table.png',
                                width: 16,
                                height: 11,
                              )
                            : Row(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class ProductListTile extends StatelessWidget {
//   final Product product;

//   const ProductListTile({Key key, this.product}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           createBlurRouteWithBlurBackground(Details(), '/details',
//               arguments: product),
//         );
//       },
//       child: Container(
//         // constraints: BoxConstraints(maxWidth: 100),
//         // color: Colors.green, // test
//         color: Colors.transparent, // что бы был кликабельным
//         // height: 120, // ?
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // test Container:
//             // Изображение товара
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 13,
//                   bottom: 13,
//                   right: 17,
//                 ),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       product.image,
//                       width: 82,
//                       height: 94,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // 1) Во-первых, Этот Flexible добавляет гибгости дочернему контейнеру.
//             // Благодаря нему длинный Заголовок товара
//             // на узком экране не обрезается, а переносится:
//             Flexible(
//               child: Container(
//                 // 2) Во-вторых, указание максимальной ширины гибкого контейнера
//                 constraints: BoxConstraints(maxWidth: 450),
//                 // color: Colors.red, // test
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 16),
//                     // Заголовок товара
//                     Text(
//                       product.title,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 84, 148, 121),
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14, // 14
//                         height: 1.4,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     // Подзаголовок товара
//                     Text(
//                       product.subtitle,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 175, 175, 189),
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12, // 14
//                         height: 1.6,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       // color: Colors.grey, // test
//                       width: 95,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Цена товара
//                           Text(
//                             '₽${product.price.toString()}',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Montserrat',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14, // 14
//                               height: 2.4,
//                             ),
//                           ),
//                           // Заказать товар
//                           product.canOrder
//                               ? Row(
//                                   children: [
//                                     Text(
//                                       '→',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: 'Montserrat',
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 12, // 14
//                                         height: 1.6,
//                                       ),
//                                     ),
//                                     SizedBox(width: 2),
//                                     Image.asset(
//                                       'assets/icons/icon_table.png',
//                                       width: 16,
//                                       height: 11,
//                                     ),
//                                   ],
//                                 )
//                               : Row(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
