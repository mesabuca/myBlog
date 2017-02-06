module ApplicationHelper
  def markdown(text)
    options = {
      fenced_code_block: true,
      no_intra_emphasis: true,
      filter_html:     true,
      hard_wrap:       true,
      superscript:     true,
      strikethrough:   true,
      laxhtmlblocks:   true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true
    }

    extensions = {
      gh_blockcode:       true,
      autolink:           true,
      superscript:        true,
      fenced_code_blocks: true,
      no_intra_emphasis:  true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
