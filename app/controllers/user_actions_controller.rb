class UserActionsController < ApplicationController
  require 'jbuilder'
  before_action :authenticate_user!

  def favorites
    if params[:search].present?
      #@favorites = current_user.favorites.es.search params[:search], page: params[:page]
      # @articles = @articles.results
      # wasn't able to figure out how to limit elasticsearch queries to just the articles favorited by the current user;
      # so just going to do simple regex match - source: http://stackoverflow.com/a/9937040
      @favorites = current_user.favorites.where(title: /#{params[:search]}/i)
    else
      @favorites = current_user.favorites.paginate(page: params[:page])
    end



  end

  def favorite
    article = Article.where(kba: params[:kba]).first
    already_favorited = current_user.articles.include? article
    if already_favorited
      current_user.articles.delete article
    else
      current_user.articles.push article
    end

    redirect_to kb_path(kba: article.kba), notice: "#{article.kba} successfully #{(already_favorited ? 'removed from' : 'added to')} favorites."
  end
end