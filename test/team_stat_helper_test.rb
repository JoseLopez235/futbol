require_relative 'test_helper'

class TeamStatHelperTest < Minitest::Test

  def setup
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'
    @stat_tracker ||= StatTracker.new({games: game_path, teams: team_path, game_teams: game_teams_path})
    @team_stat_helper ||= TeamStatHelper.new(@stat_tracker.game_table, @stat_tracker.team_table, @stat_tracker.game_team_table)
  end

  def test_collect_seasons
    expected = ["20122013", "20172018", "20132014", "20142015", "20152016", "20162017"]
    assert_equal expected, @team_stat_helper.collect_seasons("6").keys
  end

end
