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

ProductOption.delete_all
options = ProductOption.create([{title: 'Color'}, {title: 'Size'},])

ProductParam.delete_all
ProductParam.create(
    [
        {title: 'Red', product_option: options[0]},
        {title: 'Blue', product_option: options[0]},
        {title: 'Black', product_option: options[0]},

        {title: 'S', product_option: options[1]},
        {title: 'M', product_option: options[1]},
        {title: 'L', product_option: options[1]},
        {title: 'XXL', product_option: options[1]},
    ]
)