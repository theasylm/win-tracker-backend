class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :format, null: false, foreign_key: true
      t.references :magic_set, null: true, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :opponent, null: false
      t.references :commander, null: true, foreign_key: true
      t.references :opposing_commander, null: true
      t.integer :mulls
      t.integer :opponent_mulls
      t.boolean :win
      t.boolean :first
      t.references :deck, null: false, foreign_key: true
      t.string :notes
      t.datetime :date

      t.timestamps
    end

    add_foreign_key :games, :commanders, column: :opposing_commander_id, primary_key: :id
    add_foreign_key :games, :players, column: :opponent_id, primary_key: :id
  end
end
