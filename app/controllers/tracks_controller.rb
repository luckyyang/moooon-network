# frozen_string_literal: true

class TracksController < ApplicationController
  include TimelineConcern

  before_action :authenticate_user!, except: :show
  before_action :set_initial_state_data

  layout 'upload'

  def new
  end

  def show
    @track = Track.joins(:account).find_by!(
      id: params.require(:id),
      accounts: { username: params.require(:account_username) }
    )
  end

private

  def authenticate_user!
    redirect_to about_path unless user_signed_in?
  end
end
