class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.references :user, foreign_key: { to_table: :users }, null: false
      # t.integer  :user_id, null: false
      t.string   :name, null: false
      t.text     :body, null: false
      t.string   :address, null: false
      t.float  :latitude, null: false
      t.float  :longitude, null: false

      t.timestamps
    end
  end
end
