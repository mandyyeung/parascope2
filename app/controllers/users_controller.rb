class UsersController < Devise::RegistrationsController
  def create 
    super
    create_default_collection
  end
  def create_default_collection
    default_collection = Collection.find_by_name("Unsorted") ? Collection.find_by_name("Unsorted") : Collection.create(name: "Unsorted")
    current_user.collections << default_collection
  end
end