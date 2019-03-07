class ChangeHashedPasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :hashed_password
    add_column :admin_users, :digest_password, :string
  end
end
