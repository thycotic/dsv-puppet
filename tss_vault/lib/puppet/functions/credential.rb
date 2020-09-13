Puppet::Functions.create_function(:credential) do
  def credential(some_string)
    some_string.upcase
  end
end
