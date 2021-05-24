module ApplicationHelper
  def handle_vote(article)
    if voted?(article)
      content_tag(:p, 'You have already voted this article', class: 'font-weight-bold mt-3')
    else
      link_to 'Vote', add_vote_path(article_id: article.id),
              class: 'text-center w-25 mt-3 mb-3 p-2 button-sign text-white rounded nav-link m-auto'
    end
  end

  def show_votes?(article)
    return unless article.votes.count.positive?

    content_tag(:p, "#{article.votes.count} vote(s)",
                class: 'w-50 m-auto font-weight-bold mt-3 alert bg-success rounded p-1')
  end
end
