class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :neighborhood
      t.integer :menu_id

      t.timestamps

    end
  end
end
