class CreateCommanders < ActiveRecord::Migration[7.0]
  def change
    create_table :commanders do |t|
      t.string :name

      t.timestamps
    end
  end
end
