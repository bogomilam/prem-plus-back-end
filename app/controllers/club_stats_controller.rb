class ClubStatsController < ApplicationController

    def index
        club_stats = ClubStat.all
        render json: club_stats
    end

end
