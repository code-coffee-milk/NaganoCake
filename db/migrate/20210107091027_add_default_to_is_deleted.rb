class AddDefaultToIsDeleted < ActiveRecord::Migration[5.0]
  def change
    change_column_default :customers,:is_deleted, false
  end
end
