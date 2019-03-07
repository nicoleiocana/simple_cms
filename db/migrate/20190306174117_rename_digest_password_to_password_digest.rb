class RenameDigestPasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :digest_password
    add_column :admin_users, :password_digest, :string
  end
end
