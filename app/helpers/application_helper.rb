module ApplicationHelper
  def is_checked?(checkbox)
    # need to return a boolean, true or false - so when we call it, the 'checked' option will evaluate to whichever
    checkbox == "yes" ? true : false
  end

  def active_link_to(name, path, options = {})
    # basically repurposes the use of link_to, to make sure that the key 'class' in our options hash has the value of 'active' so we
    # can style our various <a> tags in our application with ease
    options[:class] = (current_page?(path)? "active" : "")
    link_to(name, path, options)
  end

  def trim_review(game, total_count)
    # this helper is for our _short_show + _tiny_show partial
    # this basically takes the entire [review] text and extracts the first 100 words
    # this only displays the 'abbreviated' review if there's any trimming that takes place
    clipped_text = game.review.split(" ").first total_count
    game.review.size > total_count ? clipped_text.join(" ") + "..." : clipped_text.join(" ")
  end

  def responsive_img_tag(attachment, sizes_attr, options={})
    small_variant = attachment.variant :small
    medium_variant = attachment.variant :medium
    large_variant = attachment.variant :large

    srcset = [
      "#{url_for(small_variant)} 200w",
      "#{url_for(medium_variant)} 300w",
      "#{url_for(large_variant)} 500w",
    ].join(", ")

    image_tag(attachment, options.merge(srcset: srcset, sizes: sizes_attr))
  end

  def cover_art_dimensions
    "(max-width: 600px) 200px, (max-width: 900px) 300px, 500px"
  end

end
