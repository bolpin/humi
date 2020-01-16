ActiveAdmin.register User do
  permit_params :email, :admin, :partner_id, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :admin
    column :partner
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :admin
      f.input :partner
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
