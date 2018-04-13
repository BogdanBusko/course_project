class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid

  attr_accessor :login

  has_many :courses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :name,               type: String
  field :username,           type: String
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  as_enum :role, admin: 'Admin', user: 'User', employer: 'Employer'

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

  def self.find_for_database_authentication conditions
    login = conditions.delete(:login)
    any_of({username: login}, email: login).first
  end

  def self.delete_unconfirmed_user
    each do |user|
      user.delete if (user.created_at.strftime('%d-%m-%y') == (Date.today - 7).strftime('%d-%m-%y')) && (user.confirmed_at == nil)
    end
  end
end
