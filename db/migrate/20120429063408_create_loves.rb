class CreateLoves < ActiveRecord::Migration
  def change
    create_table :loves do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
