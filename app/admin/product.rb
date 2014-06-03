ActiveAdmin.register Product do
  permit_params :title, :description, :price, :active, :category_id

  show do |product|
    default_main_content

    panel 'Items' do
      items = product.product_items.inject({}) do |res, item|
        res[item.size_id] ||= {}
        res[item.size_id][item.color_id] ||= 0
        res[item.size_id][item.color_id] += 1
        res
      end

      table_for product.category.colors do
        column '' do |color|
          color.title
        end

        product.category.sizes.each do |size|
          column size.title do |color|
            (items[size.id] and items[size.id][color.id]) ? items[size.id][color.id] : 0
          end
        end
      end

      render partial: 'product_item_form', locals: {product: product}
    end
  end

  # form do |f|
  #   f.inputs
  #
  #   items = product.items.inject({}) do |res, item|
  #     res[item.size_id] ||= {}
  #     res[item.size_id][item.color_id] ||= 0
  #     res[item.size_id][item.color_id] += 1
  #     res
  #   end
  #
  #   f.inputs do
  #     #   table_for product.category.colors do
  #     #     column '' do |color|
  #     #       color.title
  #     #     end
  #     #
  #     #     product.category.sizes.each do |size|
  #     #       column size.title do |color|
  #     #         # f.input "items[#{size.id}][#{color.id}]"
  #     #         # (items[size.id] and items[size.id][color.id]) ? items[size.id][color.id] : 0
  #     #         input 'aaa', '111'
  #     #       end
  #     #     end
  #     #   end
  #   end
  #
  #   f.actions
  # end

end
