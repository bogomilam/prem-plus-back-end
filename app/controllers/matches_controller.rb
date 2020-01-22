class MatchesController < ApplicationController

    def index
        # byebug
        if params['game_week']
            matches = Match.where(game_week: params['game_week'].to_i)
        else
            matches = Match.all
        end
        render json: matches, include: '*'
    end

    def show 
        match = Match.all.find(params[:id])
        render json: match
    end

    def simulate
        match = Match.find(params[:id])
        render json: { result: match.simulate(user_weightings) }
    end


    private

    def user_weightings
        params[:user_weightings] || {}
    end

end
