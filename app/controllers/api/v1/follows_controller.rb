class Api::V1::FollowsController < ApplicationController
    before_action :protected_action, only: [:create]

    def create
        follow = Follow.new(follow_params)
        follow.user = @current_user

        if follow.save
            render json: follow
        else
            render json: { errors: follow.errors.full_messages }, status: :unauthorized
        end
    end

    def show 
        follow = Follow.find(params[:id])
        render json: follow
    end

    def index
        follows = Follow.all
        # follows = @current_user.follows

        render json: follows, each_serializer: FollowSummarySerializer
    end


    private

    def follow_params
        params.require(:follow).permit(:club_id)
    end
end
