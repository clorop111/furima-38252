class CreateTagItems < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tag_items, [:item_id,:tag_id],unique: true
  end
end
