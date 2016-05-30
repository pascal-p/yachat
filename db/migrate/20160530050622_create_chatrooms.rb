class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table(:chatrooms) do |t|
      t.string :topic
      
      t.timestamps
    end
    
    add_index :chatrooms, :topic, unique: true
  end
end
