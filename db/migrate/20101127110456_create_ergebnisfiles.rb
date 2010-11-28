class CreateErgebnisfiles < ActiveRecord::Migration
  def self.up
    create_table :ergebnisfiles do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ergebnisfiles
  end
end
