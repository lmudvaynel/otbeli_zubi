class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :position
      t.string :slug
      t.text :content

      t.timestamps
    end
  end
end
