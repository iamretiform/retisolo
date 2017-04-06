class AddUserCurrentLocationToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.decimal :user_current_latitude, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :user_current_longitude , :precision => 15, :scale => 10, :default => 0.0  
    end
  end
end
