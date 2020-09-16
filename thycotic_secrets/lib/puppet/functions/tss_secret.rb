require 'tss'

Puppet::Functions.create_function(:tss_secret) do
  def tss_secret(username, password, tenant, secret_id)
    config = {
      username: username,
      password: password,
      tenant: tenant,
    }
    server = Tss::Server.new(config)

    begin
      secret = Tss::Secret.fetch(server, secret_id).to_s
    rescue InvalidSecretException
      puts "TSS: Unable to access secret"
      return nil
    end

    secret
  end
end
