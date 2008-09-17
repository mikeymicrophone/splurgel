module TagsHelper
  def tag_class_link tag, tagged_class
    link_to pluralize(tag.send(tagged_class.pluralize).count, tagged_class), send("tag_#{tagged_class.pluralize}_path", tag)
  end
end
