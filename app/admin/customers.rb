ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  filter :full_name
  filter :phone_number
  filter :email_address

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    actions
  end

  form do |f|
    f.semantic_errors

    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file,
                      input_html: { accept: "image/png,image/jpeg,image/webp" }
    end

    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image),
                    alt: customer.full_name,
                    style: "width: 150px; height: 150px; object-fit: cover;"
        else
          "No image uploaded"
        end
      end
    end
  end
end