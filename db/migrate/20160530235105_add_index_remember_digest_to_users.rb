class AddIndexRememberDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :remember_digest
  end
end
