class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :recipes, :lifecycle_state, :string, :default => "not_published"
    add_column :recipes, :key_timestamp, :datetime

    add_index :recipes, [:lifecycle_state]
  end

  def self.down
    remove_column :recipes, :lifecycle_state
    remove_column :recipes, :key_timestamp

    remove_index :recipes, :name => :index_recipes_on_lifecycle_state rescue ActiveRecord::StatementInvalid
  end
end
