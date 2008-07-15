// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function insert_comment_holder(id) {
	if ($('comments_on_comment_' + id)) {
		return true
	} else {
		var container = new Element('div', {'class':'comment', 'id':'comments_on_comment_' + id});
		Element.insert($('reply_to_comment_' + id), { before: container });
	}
}