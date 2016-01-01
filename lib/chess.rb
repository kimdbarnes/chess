require 'chess/version'
require 'chess/game'

module Chess
  def self.start
    Chess::Game.new.show
  end
end