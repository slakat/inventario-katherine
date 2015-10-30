When "I go to $page_name" do |page_name|
  visit path_to(page_name)
end

When %|I click on "$link"| do |link|
  click_link(link)
end

Then %|I should be on $page_name| do |page_name|
  current_path = URI.parse(current_url).request_uri
  expect(current_path).to eq path_to(page_name)
end
