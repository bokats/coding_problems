require 'set'

class FootballScores
  def initialize
    @score_cache = {}
  end

  def find_all_scores(scoring_ways, target_score)

    idx = 0
    while idx < scoring_ways.length && scoring_ways[idx] <= target_score
      scoring_way = scoring_ways[idx]

      if @score_cache[target_score - scoring_way]
        @score_cache[target_score - scoring_way].each do |path|
          if @score_cache[target_score]
            @score_cache[target_score] << [scoring_way] + path
          else
            @score_cache[target_score] = [[scoring_way] + path]
          end
        end

      elsif target_score - scoring_way == 0
        if @score_cache[target_score]
          @score_cache[target_score] << [scoring_way]
        else
          @score_cache[target_score] = [[scoring_way]]
        end
      else
        find_all_scores(scoring_ways, target_score - scoring_way)
        if @score_cache[target_score - scoring_way]
          @score_cache[target_score - scoring_way].each do |path|
            if @score_cache[target_score]
              @score_cache[target_score] << [scoring_way] + path
            else
              @score_cache[target_score] = [[scoring_way] + path]
            end
          end
        end
      end
      idx += 1
    end

    if @score_cache[target_score]
      @score_cache[target_score]
    else
      []
    end
  end
end

f = FootballScores.new
p f.find_all_scores([2,3,7], 6)
