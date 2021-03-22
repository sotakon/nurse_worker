class AddCorporationRefToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :corporation, foreign_key: true
  end
end
