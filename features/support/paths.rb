module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /the homepage/
      '/'
    else
      begin
        page_name =~ /(the|my) (.*)( page)?/
        path_components = $2.split(/\s+/)
        self.send(path_components.push('path').join('_'))
      rescue
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
