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

function site_chosen() {
	if (multiple_sites_being_chosen) {
		return true;
	} else {
	    $('websites').remove();
	}
}

function multiple_sites_being_chosen(toggle) {
	if (toggle) {
		multiple_sites_being_chosen = false;
		site_chosen();
	} else {
		multiple_sites_being_chosen = true;
		$('multiple_sites_toggle').inner_html = 'x';
	}
}
var multiple_sites_being_chosen = false;