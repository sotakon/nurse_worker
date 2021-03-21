class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.string :area, null: false
      t.text :content
      t.integer :people
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
