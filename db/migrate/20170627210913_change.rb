class Change < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :student_card_id, :int
  end
end
