class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user, index: true, foreign_key: true
      t.references :board, index: true, foreign_key: true
    end
  end
end
