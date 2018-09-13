class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :genre
      t.string :note
      t.boolean :allDay
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
