feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tag', with: 'education'

    click_button 'Create link'
    link = Link.first

    expect(link.tags.map(&:name)).to include('education')
    # HAVE TO SPECITY MAP WITH NAME OR IT WILL LOOK FOR TAG OBJECTS TO INCLUDE
    # 'EDUCATION', NOT THE NAMES OF THE TAG OBJECTS.
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    # the tags will be space separated
    fill_in 'tag', with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end
end
