class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :u_id
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
