# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def show
    @user = params[:id]
  end
end
