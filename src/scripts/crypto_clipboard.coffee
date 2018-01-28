# # # # # # # # # # # # # # #
# # # CRYPTO CLIPBOARD  # # #
# # # # # # # # # # # # # # #

# var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

# copyTextareaBtn.addEventListener('click', function(event) {
#  var copyTextarea = document.querySelector('.js-copytextarea');
#  copyTextarea.select();
#
#  try {
#    var successful = document.execCommand('copy');
#    var msg = successful ? 'successful' : 'unsuccessful';
#    console.log('Copying text command was ' + msg);
#  } catch (err) {
#    console.log('Oops, unable to copy');
#  }
#});
#<p>
#  <button class="js-textareacopybtn" style="vertical-align:top;">Copy Textarea</button>
#  <textarea class="js-copytextarea">Hello I'm some text</textarea>
#</p>

NOTICE_DELAY = 4000

show_notice = ($notice) ->
	$notice.fadeIn()

hide_notice = ($notice)->
	$notice.fadeOut()

copy_to_clipboard = (e) ->
	e.preventDefault()

	$input = $(e.currentTarget)
	$notice = $input.parent().find('.copy-notice')
	
	$input.get(0).select()

	try
		succeeded = document.execCommand('copy')
		if succeeded
			show_notice($notice)
	catch
		console.log('Copy paste not supported')
	
	fade_out = ->
	  hide_notice($notice)
	
	setTimeout(fade_out, NOTICE_DELAY)

module.exports = ->
	$('.bitcoin-address input, .eth-address input').on('click', copy_to_clipboard)