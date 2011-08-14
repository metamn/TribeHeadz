class ConnectEventsAndStyles < ActiveRecord::Migration
  def up
    create_table :events_styles, :id => false do |t|
      t.references :events, :null => false
      t.references :styles, :null => false
    end
  end

  def down
    drop_table :events_styles
  end
end
