class ConnectStylesAndDjs < ActiveRecord::Migration
  def up
    create_table :djs_styles, :id => false do |t|
      t.references :djs, :null => false
      t.references :styles, :null => false
    end
  end

  def down
    drop_table :djs_styles
  end
end
