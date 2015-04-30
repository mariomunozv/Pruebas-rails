class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Filterable
  require 'digest/md5'
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :timeoutable, :trackable, 
         :validatable, :encryptable

  # Fields
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

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
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time

  ## Personal Info
  field :name, type: String
  field :lastname,  type: String

  ## Validate
  validates :name,
    presence: { message: "Es necesario definir un nombre." }
  validates :lastname,
    presence: { message: "Es necesario definir un apellido." }
  validates :email,
    presence: { message: "Es necesario definir un correo electrónico." }
  validates :password,
    presence: { message: "Es necesario definir una contraseña." }
  validates :password_confirmation,
    presence: { message: "Es necesario definir una contraseña." }
  validates :role_id,
    presence: { message: "Es necesario seleccionar un rol." }

  belongs_to :role
  belongs_to :client

  def to_s
    name+" "+lastname  # editable
  end

  def password_salt
  ''
  end

  def password_salt=(new_salt)
  end

end