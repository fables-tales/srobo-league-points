require "json"
class ComputesLeagueScores
  def initialize
    @scores = {}
    @i = 4
    @score = @i
    @to_push = []
    @score_hash = {}
    @seen = 0
  end

  def add_team(team_name, score)
    @scores[team_name] = score
  end

  def league_scores
    while @seen < ordered_teams.length
      @to_push << current_team

      if current_score == next_score
        @score = @score + (@i - 1)
      else
        fill_score_hash_and_clear_to_push
        @score = @i - 1
      end
      @i = @i - 1
      @seen += 1
    end

    return @score_hash
  end

  private

  def fill_score_hash_and_clear_to_push
    @to_push.each do |team|
      @score_hash[team] = average
    end
    @to_push = []
  end

  def current_score
    @scores[current_team]
  end

  def next_score
    @scores[next_team]
  end

  def average
    @score * 1.0 / @to_push.length
  end

  def current_team
    ordered_teams[@seen]
  end

  def next_team
    ordered_teams[@seen+1]
  end

  def ordered_teams
    @scores.keys.sort {|x,y| @scores[x] <=> @scores[y]}.reverse
  end
end

def help
  puts "you probably got the arguments wrong, they are [team1] [score1] [team2] [score2] and so on for exactly 4 teams"
  exit
end

if __FILE__ == $0
  if ARGV.length != 8
    help
  end
  begin
    l = ComputesLeagueScores.new
    4.times do |i|
      team = ARGV[0+i*2]
      score = ARGV[1+i*2].to_i
      l.add_team(team, score)
    end
    puts l.league_scores.to_json
  rescue
    help
  end
end
