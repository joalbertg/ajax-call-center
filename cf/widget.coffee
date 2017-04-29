###$ ->
	xhr = new XMLHttpRequest()
	xhr.onreadystatechange = ->
		if xhr.readyState is 4
			agents = JSON.parse xhr.responseText
			widgetHTML = '<ul class="bulleted">'
			for agent in agents
				if agent.online
					liClass = 'in'
				else
					liClass = 'out'

				widgetHTML = "#{widgetHTML} <li class=\"#{liClass}\">#{agent.name}</li>"
			widgetHTML = "#{widgetHTML}</ul>"
			$('#employeeList').html widgetHTML

	xhr.open 'GET', 'data/agents.json'
	xhr.send()
###

$ ->
	$.getJSON 'data/agents.json', (response) ->
		widgetHTML = '<ul class="bulleted">'
		for agent in response
			if agent.online
				liClass = 'in'
			else
				liClass = 'out'

			widgetHTML = "#{widgetHTML} <li class=\"#{liClass}\">#{agent.name}</li>"
		widgetHTML = "#{widgetHTML}</ul>"
		$('#employeeList').html widgetHTML
