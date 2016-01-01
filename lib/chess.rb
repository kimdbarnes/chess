require 'chess/version'
require 'chess/game'
require 'chess/piece'

module Chess
  def self.start
    Chess::Game.new.show
  end
end