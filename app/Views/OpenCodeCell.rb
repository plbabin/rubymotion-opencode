class OpenCodeCell < UITableViewCell
  attr_accessor :row, :section, :tableView
  
  def initWithOpenCodeStyle(identifier, inTableView:tableView)
    self.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:identifier)
    self.tableView = tableView
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    @profileImageView = UIImageView.alloc.initWithFrame([[10,5],[36,36]])

    @profileImageView.contentMode = UIViewContentModeScaleAspectFill
    @profileImageView.clipsToBounds = true

    self.contentView.addSubview(@profileImageView)

    # Talk author name title
    @authorNameLabel = UILabel.alloc.initWithFrame([[56,5],[276,14]])
    @authorNameLabel.font = UIFont.getOpencodeFont(14,true);
    @authorNameLabel.backgroundColor = UIColor.clearColor
    @authorNameLabel.textColor = BubbleWrap.rgba_color(255,255,255,0.6)

    self.contentView.addSubview(@authorNameLabel)

    # Talk title
    @talkTitleLabel = UILabel.alloc.initWithFrame([[56,22],[216,48]])
    @talkTitleLabel.font = UIFont.getOpencodeFont(13,true);
    @talkTitleLabel.backgroundColor = UIColor.clearColor
    @talkTitleLabel.textColor = BubbleWrap.rgba_color(255,255,255,1)
    @talkTitleLabel.numberOfLines = 0
    # @talkTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    # @talkTitleLabel.sizeToFit

    self.contentView.addSubview(@talkTitleLabel)

    self
  end
  
  def fillWithTalk(talk)
    
    unless talk.image
      @profileImageView.image = UIImage.alloc.init
      self.loadImage(talk)
    else
      @profileImageView.image = talk.image
    end

    @authorNameLabel.text = talk.author_name
    @talkTitleLabel.text  = talk.title 
    # headerTitle = self.viewWithTag(TITLE_TAG)
    # headerTitle.text = data["title_fr"]
    # restoTitle = self.viewWithTag(RESTONAME_TAG)
    # restoTitle.text = "L'affaire est ketchup with a fucking double name"
  end

  def loadImage(talk)
    if talk.author_screenname
      Dispatch::Queue.concurrent.async do
        url = "http://twitter.com/api/users/profile_image/#{talk.author_screenname}?size=bigger"
        # NSLog("load : #{url}")

        profile_image_data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url))
        if profile_image_data
          talk.image = UIImage.alloc.initWithData(profile_image_data)
          Dispatch::Queue.main.sync do
            @profileImageView.image = talk.image
            self.tableView.delegate.reloadTalk(self.section, self.row)
          end
        end
      end
    else
      @profileImageView.image = talk.image = UIImage.imageNamed("avatar.png")
    end
  end

end