ActiveAdmin.register Product do
  permit_params :title, :description, :price, :active, :category_id

end
