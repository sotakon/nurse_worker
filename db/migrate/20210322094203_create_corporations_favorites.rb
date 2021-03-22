class CreateCorporationsFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :corporations_favorites do |t|
      t.integer :corporation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
