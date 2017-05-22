class FootballScores
  def initialize
    @score_cache = {}
  end

  def find_all_score_combinations(scoring_ways, target_score)

    idx = 0
    while idx < scoring_ways.length && scoring_ways[idx] <= target_score
      scoring_way = scoring_ways[idx]
      if @score_cache[target_score - scoring_way]
        add_to_cache(target_score, scoring_way)
      elsif target_score - scoring_way == 0
        if @score_cache[target_score]
          @score_cache[target_score] << [scoring_way]
        else
          @score_cache[target_score] = [[scoring_way]]
        end
      else
        find_all_score_combinations(scoring_ways, target_score - scoring_way)
        if @score_cache[target_score - scoring_way]
          add_to_cache(target_score, scoring_way)
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

  def add_to_cache(target_score, scoring_way)
    @score_cache[target_score - scoring_way].each do |path|
      if @score_cache[target_score]
        @score_cache[target_score] << [scoring_way] + path
      else
        @score_cache[target_score] = [[scoring_way] + path]
      end
    end
  end
end

# Tests(Uncomment below to test)

# f1 = FootballScores.new
# p f1.find_all_score_combinations([2, 3, 7], 10) == [[2, 2, 2, 2, 2],
#                                                     [2, 2, 3, 3],
#                                                     [2, 3, 2, 3],
#                                                     [2, 3, 3, 2],
#                                                     [3, 2, 2, 3],
#                                                     [3, 2, 3, 2],
#                                                     [3, 3, 2, 2],
#                                                     [3, 7],
#                                                     [7, 3]]
#
# f2 = FootballScores.new
# p f2.find_all_score_combinations([2, 3, 7], 6) == [[2, 2, 2],
#                                                    [3, 3]]
#
# f3 = FootballScores.new
# p f3.find_all_score_combinations([2, 3, 7], 1) == []
#
# f4 = FootballScores.new
# p f4.find_all_score_combinations([2, 3, 7], 2) == [[2]]
#
# f5 = FootballScores.new
# p f5.find_all_score_combinations([], 10) == []
#
# f6 = FootballScores.new
# p f6.find_all_score_combinations([2], 4) == [[2, 2]]
