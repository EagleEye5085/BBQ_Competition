class AddTeamsToSubmissions < ActiveRecord::Migration[5.2]
  def change
    add_reference :submissions, :team, foreign_key: true
  end
end
