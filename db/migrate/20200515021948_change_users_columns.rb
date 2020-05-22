class ChangeUsersColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :number, :integer
    add_column :users, :student_number, :string
  end
end
