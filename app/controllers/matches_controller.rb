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

end
