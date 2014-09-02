class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.belongs_to :user, index: true
      t.string :video_url
      t.string :goal
      t.string :frequency
      t.string :duration
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
