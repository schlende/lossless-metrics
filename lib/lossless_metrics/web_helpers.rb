module LosslessMetrics
  # This is not a public API
  module WebHelpers
    def root_path
      "#{env['SCRIPT_NAME']}/"
    end

    def current_path
      @current_path ||= request.path_info.gsub(/^\//,'')
    end
  end
end
