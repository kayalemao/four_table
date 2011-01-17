class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    rename_column :recipes, :country, :country_id
    change_column :recipes, :country_id, :integer, :limit => nil

    add_index :recipes, [:country_id]
  end

  def self.down
    rename_column :recipes, :country_id, :country
    change_column :recipes, :country, :string

    drop_table :countries

    remove_index :recipes, :name => :index_recipes_on_country_id rescue ActiveRecord::StatementInvalid
  end
end
