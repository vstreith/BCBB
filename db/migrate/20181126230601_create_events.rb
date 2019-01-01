class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.string :tagline
      t.datetime :date

      t.timestamps
    end
  end
end
