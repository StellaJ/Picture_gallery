module ApplicationHelper

	def status_od_visibility(boolean, options={})
		  options[:true_text] ||= ' '
		  options[:false_text] ||= ' '
		if boolean
			content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-ok')
		else
			content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-remove')
		end
	end
end
