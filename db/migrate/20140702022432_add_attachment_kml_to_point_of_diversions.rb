class AddAttachmentKmlToPointOfDiversions < ActiveRecord::Migration
  def self.up
    change_table :point_of_diversions do |t|
      t.attachment :kml
    end
  end

  def self.down
    drop_attached_file :point_of_diversions, :kml
  end
end
