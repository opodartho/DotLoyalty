class UsersController < ApplicationController
  def index
    @users = current_store.users
  end
end
