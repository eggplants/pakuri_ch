# frozen_string_literal: true

module Rack
  class Attack
    # Create thread / Post comment
    ['test/bbs', 'test/subbbs'].map do |route|
      throttle(route, limit: 1, period: Rails.env.production? ? 1.minute : 1.second) do |req|
        req.ip if req.post?
      end
    end

    # Block attacks from IPs in cache
    # To add an IP: Rails.cache.write("block 1.2.3.4", true, expires_in: 2.days)
    # To remove an IP: Rails.cache.delete("block 1.2.3.4")
    Rack::Attack.blocklist('block IP') do |req|
      Rails.cache.read("block #{req.ip}")
    end
  end
end
