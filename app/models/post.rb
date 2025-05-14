class Post < ApplicationRecord
  
  def format_text
    content = self.body
    content = format_heading(content)
    content = format_date(content)
    content = format_byline(content)
    content = format_bullets(content)
    
    self.body = content
    self.save
  end
  
  def format_heading(content)
    lines = content.split("\n")
    lines[0] = "\##{lines[0]}"
    content = lines.join('')
    content
  end
  
  def format_date(content)
    processed_lines = []
    lines = content.split("\n")
    lines.each do |line|
      if line =~ /^([A-Z][a-z]+ [0-9]+, 20[0-9][0-9])/
        processed_lines << "<p class='date'>#{line}</p>"
      else
        processed_lines << line
      end
    end
    content = processed_lines.join('')
    content
  end
  
  def format_bullets(content)
    processed_lines = []
    lines = content.split("\n")
    lines.each do |line|
      if line =~ /^(--.*)/    
        processed_lines << "* #{line.sub(/^--/, '')}" 
      else
        processed_lines << line
      end
    end
    content = processed_lines.join('')
    content
  end
  
  def format_byline(content)
    
    content
  end
  
end
