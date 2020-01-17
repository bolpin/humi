ActiveAdmin.register Grant do
  scope_to do
    current_user.partner unless current_user.admin?
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :partner_id, :amount, :date, :case_management_percentage
  #
  # or
  #
  # permit_params do
  #   permitted = [:partner_id, :amount_cents, :date, :case_management_percentage]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column(:partner) { |grant| grant.name }
    column(:amount) { |grant| grant.amount.format }
    column :date
    column :case_management_percentage
    actions
  end

  show do
    panel "Grant Details" do
      attributes_table_for grant do
        row(:partner) { |grant| grant.name }
        row(:amount) { |grant| grant.amount.format }
        row :date
        row :case_management_percentage
      end
    end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
      input :partner
      input :amount
      input :date
      input :case_management_percentage
    end
    panel 'Markup' do
      "The following can be used in the content below..."
    end
    para "Press cancel to return to the list without saving."
    actions
  end

end
