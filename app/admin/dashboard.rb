ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Donations" do
          ul do
            Donation.last(5).map do |donation|
              li link_to(donation.amount_cents, admin_donation_path(donation))
            end
          end
        end
      end
      column do
        panel "Recent Disbursements" do
          ul do
            Disbursement.last(5).map do |disbursement|
              li link_to("Move-in #{disbursement.move_in_amount_cents}/Prevention #{disbursement.prevention_amount_cents}", admin_disbursement_path(disbursement))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome, HUMI Administrator."
        end
      end
    end
  end # content
end
