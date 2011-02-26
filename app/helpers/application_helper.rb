module ApplicationHelper

  class CurrentPageDecorator
    def initialize(helper,options)
      @helper = helper
      @html_class = options[:class] || 'active'
    end
    def link_to(*args,&blk)
      name = args.first
      options = args.second || { }
      html_options = args.third || { }
      html_options[:class] = @html_class if @helper.current_page?(options)
      @helper.link_to(name,options,html_options,blk)
    end
  end

  def highlight_current_link(options = { },&blk)
    raise ArgumentError unless block_given?
    yield CurrentPageDecorator.new(self,options)
  end
end
