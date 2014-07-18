class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_collections
  has_many :collections, through: :user_collections
  has_many :articles, through: :collections
  before_create :create_default_collection

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      user.update(token: access_token.credentials.token)
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          first_name: data["first_name"],
          last_name: data["last_name"],
          token: access_token.credentials.token,
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
  def create_default_collection
    default_collection = Collection.create(name: "Unsorted")
    collections << default_collection
  end
end
