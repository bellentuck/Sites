# monkeypatch for VideoEmbed to get HTTPS urls

class VideoEmbed


  old_embed = instance_method(:embed)

  define_method(:embed) do | url, options = {} |
    s = old_embed.bind(self).(url, options)
    s.to_s rescue ''
    s.gsub('http://','https://')
  end

end

