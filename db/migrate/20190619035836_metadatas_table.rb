class MetadatasTable < ActiveRecord::Migration[5.2]
  def change
    create_table :metadatas do |t|
      t.references :user, foreign_key: true
      t.references :questions, foreign_key: true
    end
  end
end