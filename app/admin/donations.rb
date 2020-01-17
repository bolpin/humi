ActiveAdmin.register Donation do
  scope_to :current_user, unless: proc{ current_user.admin? }

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :grant_id, :donor, :date, :amount
  #
  # or
  #
  # permit_params do
  #   permitted = [:grant_id, :donor, :date, :amount_cents]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
