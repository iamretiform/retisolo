class CreateSounds < ActiveRecord::Migration[5.0]
  def change
    create_table :sounds do |t|
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
