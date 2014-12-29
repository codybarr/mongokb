class VersionController < ApplicationController

  def show
    @article = Article.where(kba: params[:kba]).first
    #@version = params[:version].to_i
    @version = @article.versions[params[:version].to_i - 1]
  end

  def revert
    # find article
    @article = Article.where(kba: params[:kba]).first
    # find version data
    @version = @article.versions.select { |ver| ver.version.to_i == params[:version].to_i}.first
    # thanks to https://github.com/mongoid/mongoid/issues/2426#issuecomment-9201601
    @article.update(title: @version.title, keywords: @version.keywords, content: @version.content, version: @version.version)

    # remove any version date newer than the reverted version

    @article.versions.each do |version|
      if (version.version.to_i >= @version.version.to_i)
        @article.versions.delete_one(version)
      end
    end

    # redirect to the article

    redirect_to kb_path(kba: @article.kba), notice: "Article #{@article.kba} was successfully reverted to version #{@version.version}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:article).permit(:kba, :version)
    end
end
