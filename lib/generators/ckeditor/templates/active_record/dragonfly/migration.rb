# frozen_string_literal: true

class CreateCkeditorAssets < ActiveRecord::Migration[5.2]
  def up
    create_table :ckeditor_assets do |t|
      t.string  :data_uid, null: false
      t.string  :data_name, null: false
      t.string  :data_mime_type
      t.integer :data_size
      t.integer :assetable_id
      t.string  :assetable_type, limit: 30
      t.string  :type, limit: 30

      # Uncomment these to save image dimensions, if your need them.
      # t.integer :data_width
      # t.integer :data_height

      t.timestamps null: false
    end

    add_index :ckeditor_assets, [:assetable_type, :type, :assetable_id], name: :idx_ckeditor_assetable_type
    add_index :ckeditor_assets, [:assetable_type, :assetable_id], name: :idx_ckeditor_assetable
  end

  def down
    drop_table :ckeditor_assets
  end
end
