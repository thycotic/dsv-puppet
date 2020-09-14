require 'tss'

Puppet::Functions.create_function(:credential) do
  def credential(username, password, tenant, cred_id)
    config = {
      username: username.to_s,
      password: password,
      tenant: tenant,
    }
    server = Tss::Server.new(config)

    begin
      secret = Tss::Secret.fetch(server, cred_id)
    rescue AccessDeniedException
      puts "Whoops, looks like we're unauthorized"
      return nil
    end

    secret
  end
end
