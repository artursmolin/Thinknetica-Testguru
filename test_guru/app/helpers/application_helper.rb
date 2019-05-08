module ApplicationHelper
  def today
     Date.current.year
  end

  def github_url(author, repo = '')
    text = repo == "" ? author : repo
    link_to text, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def thinknetica_link
    link_to "Учебный проект в онлайн-школе Thinknetica",'http://thinknetica.com', target: '_blank'
  end



end
