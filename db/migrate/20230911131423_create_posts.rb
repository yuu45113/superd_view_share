class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer  :user_id, null: false
      t.string   :name, null: false
      t.text     :body, null: false
      t.string   :address, null: false
      t.decimal  :latitude, null: false
      t.decimal  :longitude, null: false

      t.timestamps
    end
  end
end
