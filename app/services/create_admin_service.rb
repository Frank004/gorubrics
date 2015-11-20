class CreateAdminService
  def call
    member = Member.find_or_create_by!(email: Rails.application.secrets.admin_email) do |member|
        member.password = Rails.application.secrets.admin_password
        member.password_confirmation = Rails.application.secrets.admin_password
      end
  end
end
