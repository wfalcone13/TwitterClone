class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :body, null: false 
      t.integer :author_id, null: false 

      t.timestamps 
      t.index :author_id
    end
  end
end
