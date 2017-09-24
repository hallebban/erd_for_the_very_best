class CreateBestAts < ActiveRecord::Migration
  def change
    create_table :best_ats do |t|
      t.integer :user_id
      t.integer :dish_id

      t.timestamps

    end
  end
end
