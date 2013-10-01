require "securerandom"

# Currently unused.
class SimpleGuids
  def create_guid
    SecureRandom.hex
  end
end
