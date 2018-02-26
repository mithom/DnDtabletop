class User
  include Mongoid::Document
  include Mongoid::Enum
  include Constants::UserRoles

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  # Devise option: :stretches, :pepper, :encryptor, :confirm_within, :remember_for, :timeout_in, :unlock_in

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ## non devise parameters
  field :first_name, type: String, default: ''
  field :last_name, type: String, default: ''
  enum :roles, USER_ROLES, default: [FREE], multiple: true

  embeds_many :characters

  accepts_nested_attributes_for :characters

  rails_admin do
    configure :characters do
      pretty_value do
        bindings[:object].send(:characters).map { |v| "#{v.name}: " + v.to_json }.join(' <br /><br />').html_safe
      end
    end
  end
end
