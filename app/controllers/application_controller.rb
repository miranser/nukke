# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def hello
    render plain: 'Heeeeey!!'
  end

  def goodbye
    render plain: 'Здорова, Кобан!'
  end
end
