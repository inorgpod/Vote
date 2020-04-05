class AddCounterCacheToCandidate < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :vote_logs_count, :interger, default: 0
  end
end
