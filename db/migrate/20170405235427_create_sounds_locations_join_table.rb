class CreateSoundsLocationsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :sounds, :locations, table_name: :solo do |t|
      t.index :location_id
      t.index :sound_id
    end
  end
end
