# Available at: http://brewhouse-rails-template.dev/rails/mailers
class DevisePreview < ActionMailer::Preview
  def reset_password_instructions
    CustomDeviseMailer.reset_password_instructions(user, token)
  end

  if Devise.mappings[:user].lockable?
    def unlock_instructions
      CustomDeviseMailer.unlock_instructions(user, token)
    end
  end

  if Devise.mappings[:user].confirmable?
    def confirmation_instructions
      CustomDeviseMailer.confirmation_instructions(user, token)
    end

    def password_change
      CustomDeviseMailer.password_change(user)
    end
  end

  private

  def user
    User.first || sample_user
  end

  def sample_user
    user = User.new(email: "lana@example.com")

    user.name = "Lana Appleseed" if user.respond_to? :name=
    user.first_name = "Lana"     if user.respond_to? :first_name=
    user.last_name = "Appleseed" if user.respond_to? :last_name=

    user
  end

  def token
    "123"
  end
end
