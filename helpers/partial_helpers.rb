class Application
  module PartialHelpers
    def partial(page, options={})
      page = "#{page}"

      divider_index  = page.rindex('/') || -1
      divider_index += 1

      page.insert divider_index, '_'
      haml "#{page}".to_sym, options.merge!(:layout => false)
    end
  end

  helpers PartialHelpers
end
