var is_option_check = function()
{
	var chk = true;
	$("select[name^=sel_ca] option:selected").each(function() {
		chk = false;
		return false;
    });

    if(chk)
        alert('0');

    return chk;
}

var same_option_check = function(val)
{
	var chk = false;
	$("select#sel_ca_id option").each(function() {
        if(val == $(this).val()) {
            chk = true;
            return false;
        }
    });

    if(chk)
        alert('1');

    return chk;
}

var category_add = function()
{
	if(is_option_check())
		return;
	
	var sel_count = $("select#sel_ca_id option").size();	
	if(sel_count >= 3) {
		alert('2');
		return;
	}

	var sel_text = "";
	var sel_value = "";
	var gubun = "";
	for(var i=1; i<=5; i++) 
	{		
		$this = $("select#sel_ca"+i+" option:selected");
		if($this.val()) {
			sel_text += gubun + $this.text();		
			sel_value = $this.val();	
			gubun = " > ";
		}			
	}

    if(sel_value) {
        if(same_option_check(sel_value))
            return;

		$("select#sel_ca_id").append("<option value=\""+sel_value+"\">"+sel_text+"</option>");
    }	
}

var category_move = function(sel_id, type)
{
	var $el = $("select#"+sel_id+" option:selected");
	if($el.size() > 0) {
		if(type == 'prev')
			$el.insertBefore($el.prev());
		else
			$el.insertAfter($el.next());
	} else {
		alert('3');
		return;
	}
}

$(function(){
	$("button.frm_option_del").click(function() {
		var $el = $("select#sel_ca_id option:selected");
		if($el.size() > 0) {
			$el.remove();
		} else {
			alert('4');
			return;
		}
	});
});