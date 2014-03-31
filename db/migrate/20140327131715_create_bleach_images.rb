class CreateBleachImages < ActiveRecord::Migration
  def change
    create_table :bleach_images do |t|
      t.integer :page_id
      t.timestamps
    end
  end
end
