class Editions
  attr_accessor :list, :data

  def initialize
    @list = false
  end

  def load
    App::Persistence['editions'] = false
    if !App::Persistence['editions']
      BW::HTTP.get("http://opencode.ca/api/editions") do |response|
        if !response.body.nil?
          @data = BW::JSON.parse(response.body.to_str)

          # load each editions data
          loadTalk()
        end
      end
    end

  end

  def loadTalk(index = 0)
    # NSLog("http://opencode.ca/api/editions/#{index}")
    BW::HTTP.get("http://opencode.ca/api/editions/#{index}") do |response|
      if !response.body.nil?
        
        edition = BW::JSON.parse(response.body.to_str)
        talks = []

        edition["talks"].each do |el|
          talks << Talk.new(el)
        end

        @data[index]["talks"] = talks

        index=index+1
        if index < @data.count
          loadTalk(index)
        else
          save
        end

      end
    end
  end

  def save
    #App::Persistence['editions'] = BW::JSON.generate(self.data)
    self.list = @data.reverse;
  end

end