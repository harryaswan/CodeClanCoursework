class CommentsController < ApplicationController

    def index
        comments = Comment.all
        render(json: comments)
    end

    def create
      #     With validation
        Comment.create(comment_params)

      #     With out validation
      #     Comment.create({author: params[:author], text: params[:text]})

    end

    # mine
    # def create
    # end

    private

    def comment_params
        #checks that the params contains the required fields to create the object
        params.require(:comment).permit(:text, :author)
        # =>           ^Object^            ^Fields^
    end


end
