class EditionHeaderView < UIView
  def initWithFrameAndText(frame, text)
    self.initWithFrame(frame)

    self.backgroundColor = BubbleWrap.rgba_color(0,0,0,0.2)

    label = UILabel.alloc.initWithFrame([[5,5],[320,14]])
    label.backgroundColor = UIColor.clearColor
    label.font = UIFont.getOpencodeFont(14,true)
    label.textColor = BubbleWrap.rgba_color(255,255,255,0.75)
    label.text = text
    
    self.addSubview(label)

    self
  end
end