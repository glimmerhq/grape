class User < ApplicationRecord
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :following_users, through: :relationships, source: :following
  has_many :reverse_relationships, foreign_key: "following_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end

  def login
    @login || self.username || self.email
  end

  def following?(other_user)
    relationships.find_by_following_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(following_id: other_user.id)
  end
end
