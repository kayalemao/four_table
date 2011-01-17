class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :category_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :category_id
      t.integer  :recipe_id
    end
    add_index :category_assignments, [:category_id]
    add_index :category_assignments, [:recipe_id]

    create_table :categories do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :category_assignments
    drop_table :categories
  end
end
