class AddIndexToEventsOrganizerEmail < ActiveRecord::Migration
  def change
    def change
      add_index :events, :organizer_email, unique: true
    end
  end
end
