class CreateJoinTableUsersTests < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests, column_options: {  null: false, foreign_key: true } do |t|
      t.index [:user_id, :test_id], unique: true
      t.index [:user_id]
    end
  end
end
