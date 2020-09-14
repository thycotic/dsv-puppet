require 'tss'

Puppet::Functions.create_function(:tss_credential) do
  def tss_credential(username, password, tenant, cred_id)
    config = {
      username: username,
      password: password,
      tenant: tenant,
    }
    server = Tss::Server.new(config)

    begin
      secret = Tss::Secret.fetch(server, cred_id).to_s
    rescue InvalidSecretException
      puts "TSS: Unable to access secret"
      return nil
    end

    secret
  end
end
