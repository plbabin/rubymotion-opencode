class UIFont
    def self.getOpencodeFont(size, bold = false)
      fontName = if bold then "Lato-Bold" else "Lato-Regular" end

      return self.fontWithName fontName, size:size
    end
end