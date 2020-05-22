class ChangeClassToMyClass < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :class, :string
    add_column :users, :my_class, :string
  end
end
