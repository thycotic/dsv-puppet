require 'dsv'

Puppet::Functions.create_function(:dsv_secret) do
  def dsv_secret(client_id, client_secret, tenant, secret_path, metadata)
    config = {
      client_id: client_id,
      client_secret: client_secret,
      tenant: tenant,
    }

    vault = Dsv::Vault.new(config)

    begin
      secret = Dsv::Secret.fetch(vault, secret_path)

      puts secret
      unless metadata
        secret = secret['data'].to_s
      end
      puts secret
    rescue AccessDeniedException
      puts 'DSV: Unable to access secret'
      return nil
    end

    secret
  end
end
