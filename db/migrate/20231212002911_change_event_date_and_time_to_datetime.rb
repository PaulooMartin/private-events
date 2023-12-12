class ChangeEventDateAndTimeToDatetime < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.remove :date, :time
      t.datetime :datetime
    end
  end
end
