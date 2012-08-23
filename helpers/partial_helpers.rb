class Application
  module PartialHelpers
    def partial(page, options={})
      haml "_#{page}".to_sym, options.merge!(:layout => false)
    end
  end

  helpers PartialHelpers
end
