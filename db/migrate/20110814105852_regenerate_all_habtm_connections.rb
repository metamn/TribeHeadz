class RegenerateAllHabtmConnections < ActiveRecord::Migration
  def up
    drop_table :djs_events
    drop_table :djs_styles
    drop_table :events_styles
    
    create_table :djs_events, :id => false do |t|
      t.integer :dj_id
      t.integer :event_id
    end
    
    create_table :djs_styles, :id => false do |t|
      t.integer :dj_id
      t.integer :style_id
    end
    
    create_table :events_styles, :id => false do |t|
      t.integer :style_id
      t.integer :event_id
    end
  end

  def down
    drop_table :djs_events
    drop_table :djs_styles
    drop_table :events_styles
  end
end
