class OpenCodeCell < UITableViewCell
  CELL_HEIGHT       = 50;
  TITLE_TAG    = 1
  RESTONAME_TAG     = 2
  RESTOTYPE_TAG     = 3
  RESTODISTANCE_TAG = 4
  RESTOIMG_TAG      = 5
  
  # http://www.cocoawithlove.com/2009/04/easy-custom-uitableview-drawing.html

  def initWithOpenCodeStyle(identifier)
    self.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:identifier)

    # img = UIImage.imageNamed("bg_box_resto_small_highlight")
    # img.resizableImageWithCapInsets([20,20,20,20])
    # self.selectedBackgroundView = UIImageView.alloc.initWithImage(img)

    # # resto image
    # imgView = UIImageView.alloc.initWithFrame([[12,8.5],[32,32]])
    # imgView.contentMode = UIViewContentModeScaleAspectFit;
    # imgView.tag = RESTOIMG_TAG

    # self.contentView.addSubview(imgView)

    # # Resto title
    # restoTitle = UILabel.alloc.initWithFrame([[48,8.5],[259,14]])
    # restoTitle.tag = RESTONAME_TAG
    # restoTitle.backgroundColor = UIColor.clearColor
    # restoTitle.font = RSFont.fontForSizeAndBold(14)
    # restoTitle.textAlignment = UITextAlignmentLeft
    # restoTitle.textColor = RSColor.mainTextColor
    # restoTitle.numberOfLines = 1
    # # restoTitle.minimumFontSize = 10
    # # restoTitle.adjustsFontSizeToFitWidth = true

    # self.contentView.addSubview restoTitle
    
    # # Resto type
    # restoType = UILabel.alloc.initWithFrame([[48,27],[175,13]])
    # restoType.tag = RESTOTYPE_TAG
    # restoType.backgroundColor = UIColor.clearColor
    # restoType.font = RSFont.fontForSize(13)
    # restoType.textAlignment = UITextAlignmentLeft
    # restoType.textColor = RSColor.secTextColor
    # restoType.numberOfLines = 1

    # self.contentView.addSubview(restoType)

    # # distance icon
    # img = UIImage.imageNamed("ico_list_location_small")
    # imgView = UIImageView.alloc.initWithFrame([[258,29.5],[6,10]])
    # imgView.setImage img

    # self.contentView.addSubview(imgView)
    
    # restoDistance = UILabel.alloc.initWithFrame([[268,28], [40,13]])
    # restoDistance.tag = RESTODISTANCE_TAG
    # restoDistance.backgroundColor = UIColor.clearColor
    # restoDistance.font = RSFont.fontForSize(13)
    # restoDistance.textAlignment = UITextAlignmentLeft
    # restoDistance.textColor = RSColor.helperTextColor
    # restoDistance.numberOfLines = 1
    
    # self.contentView.addSubview(restoDistance)
    
    self
  end
  
  def update(data)
    # headerTitle = self.viewWithTag(TITLE_TAG)
    # headerTitle.text = data["title_fr"]
    # restoTitle = self.viewWithTag(RESTONAME_TAG)
    # restoTitle.text = "L'affaire est ketchup with a fucking double name"

    # restoType = self.viewWithTag(RESTOTYPE_TAG)
    # restoType.text = "Restaurant francais"

    # img = UIImage.imageNamed("fsq_categories/french_bg_64.png")
    # restoImg = self.viewWithTag(RESTOIMG_TAG)
    # restoImg.setImage img

    # restoDistance = self.viewWithTag(RESTODISTANCE_TAG)
    # restoDistance.text = "4.1 km"
  end

end