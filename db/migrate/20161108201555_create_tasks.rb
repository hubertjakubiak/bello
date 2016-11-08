class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :body
      t.references :list, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
