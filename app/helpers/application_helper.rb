module ApplicationHelper

	def bug(object)
		render(:partial=>'accessories/bug', :locals =>{:object=>object})
	end

	def status_of_visibility(boolean, options={})
		  options[:true_text] ||= ' '
		  options[:false_text] ||= ' '
		if boolean
			content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-ok')
		else
			content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-remove')
		end
	end


end
