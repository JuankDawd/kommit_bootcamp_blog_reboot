class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.where(follower: current_user.id)
  end

  def show
    @relationship = Relationship.find(params[:id])
  end

  def new
    @relationship = Relationship.new
  end

  def create
    other_user = User.find(relationship_params)
    @relationship = Relationship.new(
      follower_id: current_user.id,
      followed_id: other_user.id
    )

    if @relationship.save
      redirect_to root_path
    else
      message_error = 'No pudo crear su follow'
      @relationship.errors.full_messages.each do |error|
        message_error = "#{message_error} & #{error}"
      end
      render json: { error: message_error, status: 400 }, status: 400
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to root_path
  end

  private

  def relationship_params
    params.require(:relationship).permit(:other_user)[:other_user]
  end
end
