class AddMyClassToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :my_class, :string
  end
end
