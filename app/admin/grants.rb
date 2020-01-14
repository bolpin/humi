ActiveAdmin.register Grant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :partner_id, :amount_cents, :date, :case_management_percentage
  #
  # or
  #
  # permit_params do
  #   permitted = [:partner_id, :amount_cents, :date, :case_management_percentage]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
