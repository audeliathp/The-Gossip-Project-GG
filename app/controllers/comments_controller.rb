class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  
  end

  def show
    @comment = Commment.find(params[:id])

  end

  def new
    @comment = Comment.new

  end

    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], user_id: @current_user.id, gossip_id: @gossip_id)
    if @comment.save 
      redirect_back(fallback_location: root_path)
    end

  end

  def edit
   @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(post_params)
      redirect_to gossip_path(@comment.gossip.id, commentUpdated: 'true')
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id, commentDestroyed: 'true')
  end
end

private

def post_params
  post_params = params.require(:comment).permit(:content)
end