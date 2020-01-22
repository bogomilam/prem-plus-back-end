class Match < ApplicationRecord

    belongs_to :home_club, class_name: 'Club', required: true, foreign_key: :home_id
    belongs_to :away_club, class_name: 'Club', required: true, foreign_key: :away_id


    def home_club_name
        self.home_club.name
    end

    def away_club_name
        self.away_club.name
    end

    def real_date
        date = DateTime.strptime(self.date.to_s,'%s')
        date.strftime("%A %d %B %Y")   
    end

    def real_time
        date = DateTime.strptime(self.date.to_s,'%s')
        date.strftime("%R")
    end

    def simulate_single(user_weightings)
        possible_goals = (0..4).to_a
        {
            home: possible_goals.sample * ((22 + self.home_club.win_p_home) / 100.0),
            away: possible_goals.sample * ((20 + self.away_club.win_p_away) / 100.0)
        }
    end


    def simulate(user_weightings)
        results = []
        100.times do
            results << simulate_single(user_weightings)
        end
        {
            mean: results_to_mean(results)
        }
    end

    def results_to_mean(results)
        totals = results.reduce({ home: 0, away: 0 }) do |total, result| 
            {
                home: total[:home] + result[:home],
                away: total[:away] + result[:away]
            }
        end
        {
            home: totals[:home].to_f / results.length.to_f, 
            away: totals[:away].to_f / results.length.to_f 
        }
    end
    
end
