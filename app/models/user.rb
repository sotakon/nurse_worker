class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :rumors
  has_many :favorites, dependent: :destroy
  has_many :corporations_favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
      validates :name, presence: true
      validates :age, presence: true
      validates :area, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: %i(google)

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    user.save
    user
  end
end
