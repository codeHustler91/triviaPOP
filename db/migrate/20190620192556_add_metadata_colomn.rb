class AddMetadataColomn < ActiveRecord::Migration[5.2]
  def change
    add_column :metadata, :right_or_wrong, :string
  end
end
