require 'dsv'

Puppet::Functions.create_function(:dsv_credential) do
  def dsv_credential(client_id, client_secret, tenant, secret_path)
    config = {
      client_id: client_id,
      client_secret: client_secret,
      tenant: tenant,
    }

    vault = Dsv::Vault.new(config)

    begin
      secret = Dsv::Secret.fetch(vault, secret_path).to_s
    rescue AccessDeniedException
      puts "DSV: Unable to access secret"
      return nil
    end
    
    secret
  end
end
