class AddForeignKeyForCreatedBy < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :created_by, :bigint
    add_foreign_key :todos, :users, column: :created_by
  end
end
