class CreateLocationsUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :locations, :users,  table_name: :locus do |t|
      t.index :location_id
      t.index :user_id, name: :tagger_id
      t.index :user_id, name: :picker_id
    end
  end
end
