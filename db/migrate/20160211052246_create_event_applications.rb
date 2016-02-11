class CreateEventApplications < ActiveRecord::Migration
  def change
    create_table :event_applications do |t|
      t.string :name, limit: 255, null: false
      t.string :name_ruby, limit: 255, null: false
      t.integer :gender, limit: 1, default: 0, null: false
      t.string :email, limit: 600, null: false
      t.string :phone, limit: 255, null: false
      t.text :notes

      t.timestamps null: false
    end
  end
end
