class LoginEngineToVersion1 < ActiveRecord::Migration
  def self.up
    Rails.plugins["login_engine"].migrate(1)
  end

  def self.down
    Rails.plugins["login_engine"].migrate(0)
  end
end
