class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_collections
  has_many :collections, through: :user_collections
  has_many :articles, through: :collections
  before_create :create_default_collection

  def create_default_collection
    default_collection = Collection.create(name: "Unsorted", priority:0)
    collections << default_collection
  end
end
