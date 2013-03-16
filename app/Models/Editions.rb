class Editions
  attr_accessor :list, :data

  def load
    App::Persistence['editions'] = false
    if !App::Persistence['editions']
      BW::HTTP.get("http://opencode.ca/api/editions") do |response|
        if !response.body.nil?
          self.data = BW::JSON.parse(response.body.to_str)

          # load each editions data
          self.loadTalk()
        else
          self.list = false
        end
      end
    else
      self.list = BW::JSON.parse(App::Persistence['editions']);
    end

  end

  def loadTalk(index = 0)
    NSLog("http://opencode.ca/api/editions/#{index}")
    BW::HTTP.get("http://opencode.ca/api/editions/#{index}") do |response|
      if !response.body.nil?
        edition = BW::JSON.parse(response.body.to_str)
        self.data[index]["talks"] = edition["talks"]
        
        index=index+1
        if index < self.data.count
          self.loadTalk(index)
        else
          self.save
        end
      end
    end
  end

  def save
    self.data = self.data.reverse;
    App::Persistence['editions'] = BW::JSON.generate(self.data)
    self.list = self.data;
  end

end