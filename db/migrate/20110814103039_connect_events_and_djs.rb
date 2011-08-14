class ConnectEventsAndDjs < ActiveRecord::Migration
  def up
    create_table :events_djs, :id => false do |t|
      t.references :djs, :null => false
      t.references :events, :null => false
    end
  end

  def down
    drop_table :events_djs
  end
end
