class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null:false 
      t.integer :tweet_id, null:false 

      t.timestamps
      t.index [:tweet_id, :user_id], unique: true 
    end
  end
end
