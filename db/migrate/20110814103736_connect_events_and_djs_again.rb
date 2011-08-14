class ConnectEventsAndDjsAgain < ActiveRecord::Migration
  def up
    drop_table :events_djs
    
    create_table :djs_events, :id => false do |t|
      t.references :djs, :null => false
      t.references :events, :null => false
    end
  end

  def down
    drop_table :djs_events
  end
end
