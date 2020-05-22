class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :job
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
