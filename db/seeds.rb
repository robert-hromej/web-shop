Category.delete_all
categories = Category.create(
    [
        {title: 'Бюстгальтеры', active: true},
        {title: 'Комплекты белья', active: true},
        {title: 'Трусики ', active: true},
    ]
)

Product.delete_all
Product.create(
    [
        {title: 'Трусики стринг', category: categories[2], price: 12.234, active: true},
        {title: 'Трусики слип', category: categories[2], price: 687.1, active: true},
    ]
)

Color.delete_all
Color.create(
    [
        {title: 'Белый'},
        {title: 'Голубой - синий'},
        {title: 'Желтый - оранж'},
        {title: 'Звериные цвета - тигр'},
        {title: 'Зеленый'},
        {title: 'Коричневый'},
        {title: 'Красный - бордо'},
        {title: 'Металлики - золото'},
        {title: 'Принты и миксы'},
        {title: 'Розовый'},
        {title: 'Серый'},
        {title: 'Фиолет'},
        {title: 'Черный'},
        {title: 'Шампань - персик'},
    ]
)

Size.delete_all
%w(1/2 2 3 3XL 3XL/4XL 4 4XL 5 L L/XL M M/L S S/М XL XL/2XL XS XS/S XXL XXL/3XL М М/L).each do |size|
  Size.create(title: size)
end
