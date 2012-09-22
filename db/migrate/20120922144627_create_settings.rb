class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :language, :default => "ro"
      t.integer :user_id

      t.timestamps
    end
  end
end
