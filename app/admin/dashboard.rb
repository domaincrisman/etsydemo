ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    columns do

    # Here is an example of a simple dashboard with columns and panels.
    #
        column do
            panel "Recent Customers" do
              table_for User.order('id desc').limit(10).each do |user|
                column(:email)    {|user| link_to(user.email, admin_user_path(user)) }
              end
            end
        end
       column do
        div do
          br
          text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB" width="500" height="300" scrolling="no" frameborder="no"></iframe>}.html_safe
        end
      end

      
       
     # end
    end # columns
  end # content
end
