class ArticlesController < ApplicationController
    def index
        render json: Article.all
    end

    def create
        article = Article.create(article_params)
        render json: article, status: :created

    end

    def show
        article = Article.find_by(id: params[:id])
        if article
            render json: article
        else
            render json: {error: "Article not found"}, status: :not_found
        end
    end

    def update
        article = Article.find_by(id: params[:id])
        if article
            article.update(article_params)
            render json: article
        else
            render json: {error: "Article not found"}, status: :not_found
            
        end
    end

    # def destroy
    #     article = Article.find_by(id: params[:id])

    #     if article
    #         article.destroy
    #     else
    #         render json: {error: "Article deleted successfully"}, status: :
    #     end
    # end



end
