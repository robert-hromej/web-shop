ActiveAdmin.register Category do
  config.comments = false

  permit_params :title, :active, :parent_id, :retail, :wholesale, :color_ids, :size_ids

  controller do
    def update
      resource.colors = Color.where(id: params[:category][:color_ids])
      resource.sizes = Size.where(id: params[:category][:size_ids])
      super
    end
  end

  show do |category|
    default_main_content

    panel 'Colors' do
      category.colors.each do |color|
        h3 do
          label color.title
        end
      end
    end

    panel 'Sizes' do
      category.sizes.each do |size|
        h3 do
          label size.title
        end
      end
    end
  end

  form do |f|
    f.inputs
    f.inputs do
      f.input :colors, as: :check_boxes
      f.input :sizes, as: :check_boxes
    end
    f.actions
  end
end
