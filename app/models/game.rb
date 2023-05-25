class Game < ApplicationRecord
  belongs_to :format
  belongs_to :magic_set, optional: true
  belongs_to :player
  belongs_to :opponent, :class_name => "Player"
  belongs_to :commander, optional: true
  belongs_to :opposing_commander, :class_name => "Commander", optional: true
  belongs_to :deck
end
