require 'tss'

Puppet::Functions.create_function(:credential) do
  def credential(username, password, tenant, cred_id)

    server = Tss::Server.new({
      username: username.to_s,
      password: password,
      tenant: tenant
    })
    
    begin
        secret = Tss::Secret.fetch(server, cred_id)
    rescue AccessDeniedException
        puts "Whoops, looks like we're unauthorized"
    rescue  Exception => e
        puts "Something went wrong: #{e.to_s}"
    end

    return secret
  end
end
