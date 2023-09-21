class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      
      t.references :user, foreign_key: { to_table: :users }, null: false
      t.references :post, foreign_key: { to_table: :posts }, null: false
      # t.integer  :user_id, null: false
      # t.integer  :post_id, null: false

      t.timestamps
    end
  end
end
