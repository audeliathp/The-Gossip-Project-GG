class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def show

    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(content: params[:content], user: User.find(current_user.id), gossip: Gossip.find(params[:gossip_id]))

        if @comment.save
            flash[:success] = "Thanks for your comment #{@comment.user.first_name} !"
            redirect_to :controller => 'gossips', :action => 'show', id: Gossip.find(params[:gossip_id])
        else
                flash[:danger] = "Your comment was not validated... Sorry "
                render :new
        end
    end

    def edit

    end

    def update

    end


    def destroy

    end


end