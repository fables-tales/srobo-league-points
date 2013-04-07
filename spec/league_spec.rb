require_relative "../src/srobo_league_points"

describe ComputesLeagueScores do
  context "with all separate scores" do
    it "gives the teams whole numbered amounts of league points" do
      l = ComputesLeagueScores.new
      l.add_team("ABC", 8)
      l.add_team("FAC", 9)
      l.add_team("CWD", 10)
      l.add_team("TRD", 12)
      expect(l.league_scores).to be == {
        "ABC" => 1,
        "FAC" => 2,
        "CWD" => 3,
        "TRD" => 4
      }
    end
  end

  context "with a four way tie" do
    it "gives the same score to all the teams" do
      l = ComputesLeagueScores.new
      l.add_team("ABC", 8)
      l.add_team("FAC", 8)
      l.add_team("CWD", 8)
      l.add_team("TRD", 8)
      expect(l.league_scores).to be == {
        "ABC" => 2.5,
        "FAC" => 2.5,
        "CWD" => 2.5,
        "TRD" => 2.5
      }
    end
  end

  context "with a two way tie at the top" do
    it "gives 3.5 to the top two teams, and 2 and 1 to the bottom two" do
      l = ComputesLeagueScores.new
      l.add_team("ABC", 10)
      l.add_team("FAC", 10)
      l.add_team("CWD", 8)
      l.add_team("TRD", 7)
      expect(l.league_scores).to be == {
        "ABC" => 3.5,
        "FAC" => 3.5,
        "CWD" => 2,
        "TRD" => 1
      }
    end
  end

  context "with a two way tie at the bottom" do
    it "gives 4 and 3 to the top two teams, and 1.5 to the bottom two" do
      l = ComputesLeagueScores.new
      l.add_team("ABC", 11)
      l.add_team("FAC", 10)
      l.add_team("CWD", 7)
      l.add_team("TRD", 7)
      expect(l.league_scores).to be == {
        "ABC" => 4.0,
        "FAC" => 3.0,
        "CWD" => 1.5,
        "TRD" => 1.5
      }
    end
  end
  context "with a three way tie at the bottom" do
    it "gives 4 to the top team, and 2 to the bottom 3" do
      l = ComputesLeagueScores.new
      l.add_team("ABC", 11)
      l.add_team("FAC", 7)
      l.add_team("CWD", 7)
      l.add_team("TRD", 7)
      expect(l.league_scores).to be == {
        "ABC" => 4.0,
        "FAC" => 2.0,
        "CWD" => 2.0,
        "TRD" => 2.0
      }
    end
  end
end


