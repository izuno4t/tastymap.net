# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	include LoginEngine
  
	def googleapikey
		case request.env['HTTP_HOST']
		when 'localhost'
			return 'ABQIAAAAnuVtJUXKxmibPRcXICICehT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSrCkuamq53ba5hooPM9SzU47IYRQ'
		when 'localhost:3000'
			return 'ABQIAAAAnuVtJUXKxmibPRcXICICehTJQa0g3IQ9GZqIMmInSLzwtGDKaBRLZTjZvvwLJpSVl1UV0gOZsqCfIg'
		when 'tastymap.net'
			return 'ABQIAAAAnuVtJUXKxmibPRcXICICehTsaxoRVnoNoeFgrjgNP1X9C0RbehRkM1Esul7Sw7aGOZZiXBOQYphg0g'
		when 'www.tastymap.net'
			return 'ABQIAAAAnuVtJUXKxmibPRcXICICehSzLjC7AaY_OAGfRKFf9-wuGmSPnBRSqOdsHbFV2ZcDHfHNGreN_XLNmg'
		when 'noworks.railsplayground.net'
			return 'ABQIAAAAnuVtJUXKxmibPRcXICICehQ4fB866KkvzjuizTbsP7JUejpGLxSFVUr3HgwqOWwZasJpk9XolELUIQ'
		else
			return ''
		end
	end

	def googleanalystics(uacct)
		
		return "" unless 'tastymap.net' == request.env['HTTP_HOST']
		
		s = "<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\"></script>"
		s.concat("<script type=\"text/javascript\">")
		s.concat("_uacct = \"#{uacct}\";")
		s.concat("urchinTracker();")
		s.concat("</script>")
		
		return s
	end

	def n(o, r='')
		return (o.blank?)? r : o 
	end
	
	def hbr(str)
		str = html_escape(str)
		return str.gsub(/\r\n|\r|\n/, "<br />")
	end

	def buddyicon(user, d = "whoami.gif")
		return (user.buddyicon.blank?)? d : "/buddyicons/#{user.buddyicon}"
	end
end
