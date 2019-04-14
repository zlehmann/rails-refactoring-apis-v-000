class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github_repo = GithubRepo.new({})
    session[:token] = github_repo.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    redirect_to root_path
  end
end
